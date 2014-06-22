class HomePage < PageActions

  def path
    "http://BASEURL/"
  end

  def register_signin
    @browser.find_element(:id, "anchor-login")
  end

  def signout_click
    # step 1. reusing method "register_signin"
    # step 2. using Selenium API to move cursor to signin/signout section
    @browser.action.move_to(register_signin).perform

    # step 3. find all elements with tag_name "a" and click on first (using index [1])
    @browser.find_element(:id, "accountLinks").find_elements(:tag_name, "a")[1].click
  end

end