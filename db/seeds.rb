puts "destroying projects..."
Project.destroy_all

puts "destroying users..."
User.destroy_all

puts "generate project owner..."
user = User.create!({
email: "finn@gmail.com",
password: "123456"
 })

project = Project.new({
  name: "test"
})

project.user = user
project.save





puts "generate users to collaborate..."
email = [
"tim@gmail.com",
"bruno@gmail.com",
"patrick@gmail.com"
]
i = 0

3.times do
  user = User.new({
    email: email[i], password: "123456"
  })
  user.save!
  collaborator = Collaborator.new({
  })
  collaborator.user = user
  project.user = user
  i += 1
end
