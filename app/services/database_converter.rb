require 'json'

class DatabaseConverter
  # This Service Object takes in a database (of class ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
  # and converts all tables and its respective columns into a JSON object
  def initialize(database_instance)
    @database = database_instance
  end

  # def convert
  #   # This is the method that converts the DB into JSON
  #   tables = @database.tables
  #   table_hash = {}
  #
  #   tables.each do |table_header|
  #     # Building Ruby Hash with table names, columns and column types
  #     table_hash["#{table_header}"] = {}
  #
  #     @database.columns(table_header).each do |column|
  #       table_hash["#{table_header}"]["#{column.name}"] = column.type
  #     end
  #   end
  #
  #   save_database(table_hash.to_json)
  # end

  def save_database
    user = User.create!(email: "THIS@gmail.com", password: "123456")
    project = Project.create!(name: "THIS PROJECT", user: user)

    tables = @database.tables

    # @database = Database.new(name: @database.name, project: Project.find(params[:project_id]))

    @database = Database.new(name: @database.name, project: Project.find(project)

    if save_tables(tables)
      if @database.save
        puts "SAVED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      else
        # TODO: tie in with error alert
      end
    end
  end

  def save_tables(tables)
    tables.each do |key, _|
      table = Table.new(name: key)
      table.database = @database

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
      Column.new(name: column.name, datatype: column.type)
      column.table = table

      column.save ? true : false
    end
  end
end
