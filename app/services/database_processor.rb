require 'pg'

class DatabaseProcessor
    def initialize(options = {})
        @host = options[:host]
        @db_name = options[:db_name]
        @user = options[:user]
        @password = options[:password]
        @db_xml = []
    end

    def call
        @connection = PG.connect host: @host, dbname: @db_name, user: @user, password: @password

        # Each table is a hash where the key is "table_name" and the value is the actual name of the table
        tables = @connection.exec "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'"

        convert_to_xml(tables)
    rescue PG::Error => e
        puts e.message
    ensure
        @connection&.close
    end

    def convert_to_xml(tables)
        xml_export = File.new("app/services/#{@db_name}_export.xml", 'w')

        tables.each do |key, _|
            key.each do |_, table_name|
                db_xml = @connection.exec "SELECT table_to_xml_and_xmlschema('#{table_name}', false, false, '')"

                db_xml.map do |xml|
                    xml_export.write("#{xml}\n", mode: 'a')
                end
            end
        end
    end
end
