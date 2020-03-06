require 'pg'

begin

    con = PG.connect :dbname => 'thisdb', :user => 'bruncky',
        :password => '2203'

    user = con.user
    db_name = con.db
    pswd = con.pass

    puts "User: #{user}"
    puts "Database name: #{db_name}"
    puts "Password: #{pswd}"

rescue PG::Error => e

    puts e.message

ensure

    con.close if con

end
