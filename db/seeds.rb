
Column.destroy_all
Table.destroy_all
Database.destroy_all

puts "destroying projects..."
Project.destroy_all

puts "destroying users..."
User.destroy_all

puts "generate project owner..."

user = User.create!({
  email: "finn@gmail.com",
  password: "123456"
 })

puts "Generating project..."

project = Project.new({
  name: "test"
})

project.user = user
project.save!

Collaborator.create!(user: user, project: project)

puts "generate users to collaborate..."

emails = [
"tim@gmail.com",
"bruno@gmail.com",
"patrick@gmail.com"
]

emails.each do |email|
  other_user = User.create!(email: email, password: "123456")
  Collaborator.create!(user: other_user, project: project)
end

database = Database.create!(name: "db_test", db_json: {test_key: "test_value"}, project: project)

table = Table.create!(database: database, name: "test_table")

Column.create!(name: "one_column", datatype: "integer", table: table)
Column.create!(name: "two_column", datatype: "integer", table: table)
Column.create!(name: "three_column", datatype: "integer", table: table)

table_2 = Table.create!(database: database, name: "test_table_two")

Column.create!(name: "one_column", datatype: "integer", table: table_2)
Column.create!(name: "two_column", datatype: "integer", table: table_2)
Column.create!(name: "three_column", datatype: "integer", table: table_2)

table_3 = Table.create!(database: database, name: "test_table_two")

Column.create!(name: "one_column", datatype: "integer", table: table_3)
Column.create!(name: "two_column", datatype: "integer", table: table_3)
Column.create!(name: "three_column", datatype: "integer", table: table_3)
