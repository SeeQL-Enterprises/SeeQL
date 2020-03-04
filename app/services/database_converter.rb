require 'json'

class DatabaseConverter
  # This Service Object takes in a database (of class ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
  # and converts all tables and its respective columns into a JSON object
  def initialize(database_instance)
    @database = database_instance
  end

  def convert
    # This is the method that converts the DB into JSON
    tables = @database.tables
    table_hash = {}

    tables.each do |table_header|
      # Building Ruby Hash with table names, columns and column types
      table_hash["#{table_header}"] = {}

      @database.columns(table_header).each do |column|
        table_hash["#{table_header}"]["#{column.name}"] = column.type
      end
    end

    save_database(table_hash.to_json)
  end

  def save_database(db_json)
    # user = User.create!(email: "THIS@gmail.com", password: "123456")
    # project = Project.create!(name: "THIS PROJECT", user: user)

    @database = Database.new(name: @database.name, db_json: db_json, project: Project.find(params[:project_id]))

    if save_tables(db_json)
      if @database.save
        # TODO: tie in with success alert
      else
        # TODO: tie in with error alert
      end
    end
  end

  def save_tables(db_json)
    JSON.parse(db_json).each do |key, _|
      table = Table.new(name: key)
      table.database = @database

      if save_columns(db_json, table) == true
        table.save
        true
      else
        false
      end
    end
  end

  def save_columns(db_json, table)
    JSON.parse(db_json).each do |key , value|
      if key == table.name
        value.each do |key, value|
          column = Column.new(name: key, data_type: value)
          column.table = table

          column.save ? true : false
        end
      end
    end
  end
end
