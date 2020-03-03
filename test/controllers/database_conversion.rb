require 'json'

table_headers = ActiveRecord::Base.connection.tables
table_hash = {}

table_headers.each do |table|
  table_hash["#{table}"] = []

  ActiveRecord::Base.connection.columns(table).each do |column|
    table_hash["#{table}"] << column.name
  end
end

table_hash.to_json
