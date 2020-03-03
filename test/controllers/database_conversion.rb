require 'json'

table_headers = ActiveRecord::Base.connection.tables

table_headers.each do |table|
  tables = ["#{table}"]

  ActiveRecord::Base.connection.columns(table).map do |column|
    tables << column.name
  end

  puts tables.to_json
end
