require 'json'

class DatabaseConverter
  # This Service Object takes in a database and converts all tables and its respective columns into a JSON object
  def initialize(database_instance)
    @database = database_instance
  end

  def convert
    table_headers = @database.tables
    table_hash = {}

    table_headers.each do |table|
      table_hash["#{table}"] = []

      @database.columns(table).each do |column|
        table_hash["#{table}"] << column.name
      end
    end

    table_hash.to_json
  end

  def save(db_json)
    user = User.create!(email: "email@gmail.com", password: "123456")
    project = Project.create!(name: "test project", user: user)

    database = Database.new(name: "Our Database", db_json: db_json, project: project)

    if database.save
      puts "SAVED"
    else
      puts "REKT"
    end
  end
end
