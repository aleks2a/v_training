require 'selenium-webdriver'
require 'json'
require 'rspec'
require 'net/ssh'
require 'net/http'
require 'net/ssh/gateway'


SERVER_LABELS = {:production => "usps.com",
                 :qa1 => "integration.usps.com",
                 :qa2 => "trunk.usps.com"
}

def get_env
  env = (ENV['ENVIRONMENT'] || :production).to_sym
  SERVER_LABELS[env]
end

class WebHelper

  $browser_name = (ENV['BROWSER'] || :firefox).to_sym

  def initialize
    $browser = Selenium::WebDriver.for $browser_name
    $browser.manage.timeouts.implicit_wait = 5
  end

  def usps
     USPS.new
  end

end


World { WebHelper.new } if !ENV['NOT_UI']




# if scenario failed, create unique file_name and attach screenshot to report.html file
After do |scenario|
  $browser.quit if $browser !=nil
  if scenario.failed? && !ENV['NOT_UI']
    FileUtils.mkdir_p("screenshots") if !File.directory? "screenshots"
      file_name = Time.now.to_s + ".png"
      $browser.save_screenshot "screenshots/#{file_name}"
      embed("screenshots/#{file_name}", 'image/png')
  end
end


Before('@active')do
  server_ip = (ENV['IP']).to_s

  $gateway = Net::SSH::Gateway.new(
      server_ip, 'bayqa', :password =>'password01'
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
end

After('@active')do
  $gateway.shutdown!
end







