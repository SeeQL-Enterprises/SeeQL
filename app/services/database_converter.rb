require 'json'

class DatabaseConverter
  # This Service Object takes in a database and converts all tables and its respective columns into a JSON object
  def initialize(database_instance)
    @database = database_instance
  end

  def convert
    tables = @database.tables
    table_hash = {}

    tables.each do |table_header|
      table_hash["#{table_header}"] = {}

      @database.columns(table_header).each do |column|
        table_hash["#{table_header}"]["#{column.name}"] = column.type
      end
    end

    save(table_hash.to_json)
  end

  def save_database(db_json)
    user = User.create!(email: "THIS@gmail.com", password: "123456")
    project = Project.create!(name: "THIS PROJECT", user: user)

    database = Database.new(name: "THIS DATABASE", db_json: db_json, project: project)

    save_tables(db_json)
    save_columns(db_json)

    if save_tables == true && save_columns == true
      if database.save
        puts "SAVED"
      else
        puts "REKT"
      end
    end
  end

  def save_tables
  end

  def save_columns
  end
end
