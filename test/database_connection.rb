require 'pg'

begin

    connection = PG.connect dbname: 'thisdb', user: 'bruncky', password: '2203'

    user = connection.user
    db_name = connection.db
    password = connection.pass

    puts "User: #{user}"
    puts "Database name: #{db_name}"
    puts "Password: #{password}"

rescue PG::Error => e

    puts e.message

ensure

    connection&.close if connection

end
