class PageActions

  attr_reader :browser
  # including RSpec matchers for assertions
  # in new versions 'selenium-webdriver' gem may be included by default
  # include RSpec::Matchers

  def initialize browser
    @browser = browser
  end

  def build_url
    # EXAMPLE of how method works (on FindZipCodePage class)
    #1. temp = self.path   will return String from class where method was called
    #    >> temp =  "https://tools.BASEURL/go/ZipLookupAction!input.action"
    #2. we are using gsub method (Ruby method) to replace value 'BASEURL' in strind with value which will return method 'get_env' (located in env.rb)
    # method 'get_env' by default will return value "usps.com"
    # temp.gsub!("BASEURL", "usps.com")
    # >>   "https://tools.usps.com/go/ZipLookupAction!input.action"
    self.path.gsub!("BASEURL", get_env)
  end

  def visit
    # using Selenium API 'navigate.to' and for URL call method build_url
    @browser.navigate.to build_url
  end

end