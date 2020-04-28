
Column.destroy_all
Table.destroy_all
Database.destroy_all

puts "Destroying projects..."
Project.destroy_all

puts "Destroying users..."
User.destroy_all

puts "Generate project owner..."

user = User.create!({
  email: "finn@gmail.com",
  password: "123456",
  name: "Finn"
 })

puts "Generating project..."

project = Project.new({
  name: "Yelp Clone"
})

project.user = user
project.save!

project2 = Project.new({
  name: "MySQL"
})

project2.user = user
project2.save!

Collaborator.create!(user: user, project: project)

puts "generate users to collaborate..."

emails = [
    "tim@gmail.com",
    "bruno@gmail.com",
    "patrick@gmail.com"
]

names = %w[Tim Bruno Patrick]

emails.each_with_index do |email, index|
    other_user = User.create!(name: names[index], email: email, password: "123456")
    Collaborator.create!(user: other_user, project: project)
end

database = Database.create!(name: "Nando's", project: project)

table = Table.create!(database: database, name: "Restaurants")

Column.create!(name: "id", datatype: "serial", table: table)
Column.create!(name: "name", datatype: "string", table: table)
Column.create!(name: "address", datatype: "string", table: table)
Column.create!(name: "rating", datatype: "integer", table: table)

table_2 = Table.create!(database: database, name: "Reviews")

Column.create!(name: "id", datatype: "serial", table: table_2)
Column.create!(name: "rating", datatype: "integer", table: table_2)
Column.create!(name: "content", datatype: "text", table: table_2)
Column.create!(name: "restaurant_id", datatype: "foreign key", table: table_2)
Column.create!(name: "user_id", datatype: "foreign key", table: table_2)

table_3 = Table.create!(database: database, name: "Reservations")

Column.create!(name: "id", datatype: "serial", table: table_3)
Column.create!(name: "time", datatype: "time", table: table_3)
Column.create!(name: "restaurant_id", datatype: "foreign key", table: table_3)
Column.create!(name: "user_id", datatype: "foreign key", table: table_3)

table_4 = Table.create!(database: database, name: "Users")

Column.create!(name: "id", datatype: "serial", table: table_4)
Column.create!(name: "email", datatype: "string", table: table_4)
Column.create!(name: "password", datatype: "password", table: table_4)
