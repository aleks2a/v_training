require 'selenium-webdriver'
require 'json'
require 'rspec'
require 'net/ssh'
require 'net/http'
require 'net/ssh/gateway'

#hash holding values for test servers
SERVER_LABELS = {:production => "usps.com",
                 :qa1 => "integration.usps.com",
                 :qa2 => "trunk.usps.com"}


def get_env
  # read system environment variable with name 'ENVIRONMENT' if variable not defined => assign default value to :production
  env = (ENV['ENVIRONMENT'] || :production).to_sym
  # return value from SERVER_LABELS for key env
  SERVER_LABELS[env]
end

class WebHelper
  # read system environment variable with name 'BROWSER' if variable not defined => assign value to :firefox
  $browser_name = (ENV['BROWSER'] || :firefox).to_sym

  # initialize method automatically creating instance of SeleniumWebDriver
  def initialize
    $browser = Selenium::WebDriver.for $browser_name
    $browser.manage.timeouts.implicit_wait = 5
  end

  # method will return instance of USPS class
  def usps
     USPS.new
  end

end

# create world with WebHelper class if 'NOT_UI' system environment variable not defined
World { WebHelper.new } if !ENV['NOT_UI']




#After hook will execute code after each scenario
After do |scenario|
  if scenario.failed? && !ENV['NOT_UI']
  # if scenario failed, create unique file_name and attach screenshot to report.html file
    FileUtils.mkdir_p("screenshots") if !File.directory? "screenshots"
      file_name = Time.now.strftime("%Y-%m-%d_at_%H.%M.%S").to_s + ".png"
      $browser.save_screenshot "screenshots/#{file_name}"
      #embed screenshot to report.html file
      embed("screenshots/#{file_name}", 'image/png')
  end
  #Selenium method 'quit' after each scenario
  $browser.quit if $browser !=nil
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







