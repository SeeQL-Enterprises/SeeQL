Column.destroy_all
Table.destroy_all
Database.destroy_all

puts "Destroying projects..."
Project.destroy_all

puts "Destroying users..."
User.destroy_all

puts "Generate project owner..."

user = User.create!({
  email: "brunobrunckhorst@gmail.com",
  password: "123123",
  first_name: "Bruno",
  last_name: "A. Brunckhorst"
})
user.confirm

puts "Generating collaborators..."

collaborator1 = User.create!({
  email: "brunobrunckhorst@hotmail.com",
  password: "123123",
  first_name: "Bruno",
  last_name: "H. Brunckhorst"
})
collaborator1.confirm

collaborator2 = User.create!({
   email: "bruncky.gg@gmail.com",
   password: "123123",
   first_name: "Bruno",
   last_name: "G. Brunckhorst"
})
collaborator2.confirm

puts "Generating projects..."

project_names = [
    "Blep 1",
    "Blep 2",
    "Blep 3",
    "Blep 4",
    "Blep 5",
    "Blep 6",
]

project_names.each do |project_name|
    project = Project.new(name: project_name)
    project.project_image.attach(io: URI.open('https://res.cloudinary.com/seeql/image/upload/v1593538688/Seed%20Assets/Project%20Image.jpg'), filename: 'image.png')

    project.user = user
    project.save!

    puts "#{project.name} generated!"

    Collaborator.create!(user: collaborator1, project: project)
    Collaborator.create!(user: collaborator2, project: project)
end
#
# emails = [
#     "tim@gmail.com",
#     "bruno@gmail.com",
#     "patrick@gmail.com"
# ]
#
# names = %w[Tim Bruno Patrick]
#
# emails.each_with_index do |email, index|
#     other_user = User.create!(name: names[index], email: email, password: "123456")
#     Collaborator.create!(user: other_user, project: project)
# end
#
# database = Database.create!(name: "Nando's", project: project)
#
# table = Table.create!(database: database, name: "Restaurants")
#
# Column.create!(name: "id", datatype: "serial", table: table)
# Column.create!(name: "name", datatype: "string", table: table)
# Column.create!(name: "address", datatype: "string", table: table)
# Column.create!(name: "rating", datatype: "integer", table: table)
#
# table_2 = Table.create!(database: database, name: "Reviews")
#
# Column.create!(name: "id", datatype: "serial", table: table_2)
# Column.create!(name: "rating", datatype: "integer", table: table_2)
# Column.create!(name: "content", datatype: "text", table: table_2)
# Column.create!(name: "restaurant_id", datatype: "foreign key", table: table_2)
# Column.create!(name: "user_id", datatype: "foreign key", table: table_2)
#
# table_3 = Table.create!(database: database, name: "Reservations")
#
# Column.create!(name: "id", datatype: "serial", table: table_3)
# Column.create!(name: "time", datatype: "time", table: table_3)
# Column.create!(name: "restaurant_id", datatype: "foreign key", table: table_3)
# Column.create!(name: "user_id", datatype: "foreign key", table: table_3)
#
# table_4 = Table.create!(database: database, name: "Users")
#
# Column.create!(name: "id", datatype: "serial", table: table_4)
# Column.create!(name: "email", datatype: "string", table: table_4)
# Column.create!(name: "password", datatype: "password", table: table_4)
