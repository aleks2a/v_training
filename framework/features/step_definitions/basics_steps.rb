Given /^I navigate to USPS page$/ do
  # call method usps (method defined in env.rb file) => method will return instance of USPS class
  # USPS class has 3 methods (home_page, signin_page, find_zip_code_page)
  # each method will return instance of page class
  # visit method is common method for all pages and defined in PageActions class
  usps.home_page.visit
end

When /^I click on Register\/Sign in button$/ do
  # method register_signin defined in class HomePage
  # method will return Web element with (:id, "anchor-login") and .click will click on element
  usps.home_page.register_signin.click
end

Then (/^I type "(.*?)" as a login and "(.*?)" as a password$/) do |login, password|
  # here is 2 examples how we can send_keys in text field
  # 1. we are sending 'login' to method and type in text field in method 'send_login'
  # 2. we are calling method password_field (which returning Web element) and type from steps file

  # send_login method take 1 argument, we are sending keys to text field in send_login method
  usps.signin_page.send_login login
  # here we are sending keys from steps file
  usps.signin_page.password_field.send_keys password
  usps.signin_page.sign_in_button.click
end

Then (/^I should see "(.*?)" in login section$/) do |name|
  # assertion: text from login section should be equal 'name' (from feature file)
  usps.home_page.register_signin.text.should == name
end

