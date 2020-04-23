require 'mysql2'

class MySQLAccessor
    # This Service Object connects to a MySQL database and
    # saves them and their respective columns as objects
    def initialize(options = {})
        @name = options[:name]
        @host = options[:host]
        @port = options[:port]
        @db_name = options[:db_name]
        @user = options[:user]
        @password = options[:password]
        @project_id = options[:project_id]
    end

    def call
        @connection = Mysql2::Client.new(host: @host, port: @port, database: @db_name, username: @user, password: @password)

        # Each table is a hash where the key is "Tables_in_database_name" and the value is the actual name of the table
        tables = @connection.query('SHOW TABLES;')

        save_database(tables)
    rescue Mysql2::Error => e
        puts e.message
    ensure
        @connection&.close
    end

    def save_database(tables)
        # project = Project.find(@project_id)
        project = Project.find(3)

        database = Database.new(name: @name, project: project)

        return unless save_tables(database, tables)

        if database.save
            puts 'SUCCESS: MySQL DB saved'
        else
            puts 'ERROR: MySQL DB not saved'
        end
    end

    def save_tables(database, tables)
        tables.each do |table|
            table.each do |_, table_name|
                foreign_keys = { 'not' => 'yet' }

                table = Table.new(name: table_name, foreign_keys: foreign_keys)
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
        columns = @connection.query("DESCRIBE #{table.name}")

        columns.each do |column|
            column = Column.new(name: column['Field'], datatype: column['Type'])
            column.table = table

            column.save ? true : false
        end
    end
end
