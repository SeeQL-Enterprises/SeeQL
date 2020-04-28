require 'mysql2'

class MysqlAccessor
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
        tables = @connection.query("SELECT table_name FROM information_schema.tables WHERE table_schema = '#{@db_name}'")

        save_database(tables)
    rescue Mysql2::Error => e
        puts e.message
    ensure
        @connection&.close
    end

    def save_database(tables)
        project = Project.find(@project_id)

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
                foreign_keys = @connection.query("
                SELECT
                    referenced_table_name AS from_table,
                    referenced_column_name AS from_column,
                    table_name AS to_table
                FROM
                    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                WHERE
                    REFERENCED_TABLE_SCHEMA = '#{@db_name}' AND
                    REFERENCED_TABLE_NAME = '#{table_name}'
                ")

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
        columns = @connection.query("
            SELECT
                column_name, data_type
            FROM
                information_schema.columns
            WHERE
                table_schema = '#{@db_name}' AND
                table_name = '#{table.name}'
            ")

        columns.each do |column|
            column = Column.new(name: column['COLUMN_NAME'], datatype: column['DATA_TYPE'])
            column.table = table

            column.save ? true : false
        end
    end
end
