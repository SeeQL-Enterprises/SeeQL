Table.destroy_all
Column.destroy_all
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

database = Database.create!(name: "db_test", schema_file: "test_filepath", project: project)

Table.create!(database: database, name: "test_table")
