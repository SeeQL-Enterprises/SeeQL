require 'pg'

class DatabaseAccessor
  # This Service Object takes in a database (of class ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
  # and converts all tables and its respective columns into a JSON object
  def initialize(options = {})
    @name = options[:name]
    @host = options[:host]
    @db_name = options[:db_name]
    @user = options[:user]
    @password = options[:password]
    @project_id = options[:project_id]
  end

  def call
    begin
      @connection = PG.connect host: @host, dbname: @db_name, user: @user, password: @password

      # Each table is a hash where the key is "table_name" and the value is the actual name of the table
      tables = @connection.exec "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'"

      save_database(tables)
    rescue PG::Error => error

      puts error.message

    ensure

      @connection.close if @connection

    end
  end

  def save_database(tables)
    user = User.first
    project = Project.find(@project_id)

    database = Database.new(name: @name, project: project)

    if save_tables(database, tables)
      if database.save
        puts "SUCCESS: DB saved"
      else
        puts "ERROR: DB not saved"
      end
    end
  end

  def save_tables(database, tables)
    tables.each do |key, _|
      key.each do |_ , value|

        foreign_keys = @connection.exec "
        SELECT
          tc.table_name AS from_table,
          kcu.column_name AS from_column,
          ccu.table_name AS to_table
        FROM information_schema.table_constraints AS tc
        JOIN information_schema.key_column_usage AS kcu
          ON tc.constraint_name = kcu.constraint_name
          AND tc.table_schema = kcu.table_schema
        JOIN information_schema.constraint_column_usage AS ccu
          ON ccu.constraint_name = tc.constraint_name
          AND ccu.table_schema = tc.table_schema
        WHERE tc.constraint_type = 'FOREIGN KEY'
        AND tc.table_name = '#{value}'"

        table = Table.new(name: value, foreign_keys: foreign_keys)
        table.database = database

        if save_columns(table)
          table.save
          true
        else
          false
        end

      end
    end
  end

  def save_columns(table)
    columns = @connection.exec "SELECT column_name, data_type FROM information_schema.columns WHERE table_name = '#{table.name}'"

    columns.each do |column|
      column = Column.new(name: column["column_name"], datatype: column["data_type"])
      column.table = table

      column.save ? true : false
    end
  end
end
