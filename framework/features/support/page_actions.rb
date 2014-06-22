class PageActions

  include RSpec::Matchers

  def initialize browser
    @browser = browser
  end

  def build_url
    self.path.gsub!("BASEURL", get_env)
  end

  def visit
    @browser.navigate.to build_url
  end

end