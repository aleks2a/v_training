require 'active_record'
require 'net/ssh/gateway'

$gateway = Net::SSH::Gateway.new(
    '192.168.1.8', 'bayqa', :password =>'password01'
)
puts "connection has been established!!!!" if $gateway.active?
port = $gateway.open('127.0.0.1', 3306, 3307)


ActiveRecord::Base.establish_connection(
                        :adapter => 'mysql2',
                         :host    => '127.0.0.1',
                         :username => 'igordor',
                         :password => 'password',
                         :database => 'simple_cms_development',
                         :socket => 'private/tmp/mysql.sock',
                         :port => port
    )

class Subject < ActiveRecord::Base

end




