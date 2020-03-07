require 'pg'

class DatabaseProcessor
  def initialize
    @host = options[:host]
    @db_name = options[:db_name]
    @user = options[:user]
    @password = options[:password]
  end

  def call
    begin
      @connection = PG.connect host: @host, dbname: @db_name, user: @user, password: @password

      # Each table is a hash where the key is "table_name" and the value is the actual name of the table
      tables = @connection.exec "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'"

      convert_to_xml(tables)
    rescue PG::Error => error

      puts "Error, fam: #{error.message}"

    ensure

      @connection.close if @connection

    end
  end

  def convert_to_xml(tables)
    tables.map do |table|
      @connection.exec table_to_xml()
    end
  end
end
