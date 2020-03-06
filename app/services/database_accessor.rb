require 'pg'

class DatabaseAccessor
  # This Service Object takes in a database (of class ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
  # and converts all tables and its respective columns into a JSON object
  def initialize(database_instance)
    begin
      connection = PG.connect :dbname => 'thisdb', :user => 'bruncky', :password => '2203'

      user = connection.user
      db_name = connection.db
      password = connection.pass

      puts "User: #{user}"
      puts "Database name: #{db_name}"
      puts "Password: #{password}"

    rescue PG::Error => error

      puts error.message

    ensure

      connection.close if connection

    end

    @database = database_instance
  end

  def save_database
    user = User.create!(email: "THIS@gmail.com", password: "123456")
    project = Project.create!(name: "THIS PROJECT", user: user)

    tables = @database.tables

    database = Database.new(name: @database.current_database, project: project)

    if save_tables(database, tables)
      if database.save
        # TODO: tie in with success alert
      else
        # TODO: tie in with error alert
      end
    end
  end

  def save_tables(database, tables)
    tables.each do |key, _|
      table = Table.new(name: key)
      table.database = database

      if save_columns(table)
        table.save
        true
      else
        false
      end
    end
  end

  def save_columns(table)
    @database.columns(table.name).each do |column|
      column = Column.new(name: column.name, datatype: column.type)
      column.table = table

      column.save ? true : false
    end
  end
end
