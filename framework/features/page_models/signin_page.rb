class SignInPage < PageActions

  def login_field
    @browser.find_element(:id, "userName")
  end

  def password_field
    @browser.find_element(:id, "password")
  end

  def send_login login
    # reusing method login_field so we can use
    login_field.send_keys login
  end

  def sign_in_button
    @browser.find_element(:id, "sign-in-button")
  end

end