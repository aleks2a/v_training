class HomePage < PageActions

  def path
    "http://BASEURL/"
  end

  def register_signin
    @browser.find_element(:id, "anchor-login")
  end

end