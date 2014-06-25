require 'net/ssh/gateway'
require 'active_record'

# there is no password here as the local user `user` has an SSH key stored on the remote server
gateway = Net::SSH::Gateway.new('172.17.251.213', 'bayqa', :password => "password01")
port = gateway.open('127.0.0.1', 3306, 3307)

ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    host: '127.0.0.1',
    username: 'igordor',
    password: 'password',
    database: 'simple_cms_development',
    socket: 'private/tmp/mysql.sock',
    port: port
)


 class Subject < ActiveRecord::Base
   def self.all_subject
     p self.all
   end
 end


Subject.all_subject


