
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

database = Database.create!(name: "Yelp", project: project)

table = Table.create!(database: database, name: "Restaurants")

Column.create!(name: "name", datatype: "string", table: table)
Column.create!(name: "address", datatype: "string", table: table)
Column.create!(name: "rating", datatype: "integer", table: table)

table_2 = Table.create!(database: database, name: "Reviews")

Column.create!(name: "rating", datatype: "integer", table: table_2)
Column.create!(name: "content", datatype: "text", table: table_2)
Column.create!(name: "restaurant_id", datatype: "foreign key", table: table_2)
Column.create!(name: "user_id", datatype: "foreign key", table: table_2)

table_3 = Table.create!(database: database, name: "Reservations")

Column.create!(name: "time", datatype: "time", table: table_3)
Column.create!(name: "restaurant_id", datatype: "foreign key", table: table_3)
Column.create!(name: "user_id", datatype: "foreign key", table: table_3)
