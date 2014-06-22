class SignInPage < PageActions

  def login_field
    @browser.find_element(:id, "userName")
  end

  def password_field
    @browser.find_element(:id, "password")
  end

  # reusing method "login_field"
  def send_login login
    login_field.send_keys login
  end

  # reusing method "send_password"
  def send_password password
    password_field.send_keys password
  end

  def sign_in_button
    @browser.find_element(:id, "sign-in-button")
  end

end