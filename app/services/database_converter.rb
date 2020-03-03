require 'json'

class DatabaseConverter
  # This Service Object takes in a database and converts all tables and its respective columns into a JSON object
  def initiaize(database_instance)
    @database = database_instance
  end

  def convert
    table_headers = ActiveRecord::Base.connection.tables
    table_hash = {}

    table_headers.each do |table|
      table_hash["#{table}"] = []

      ActiveRecord::Base.connection.columns(table).each do |column|
        table_hash["#{table}"] << column.name
      end
    end

    table_hash.to_json
  end
end
