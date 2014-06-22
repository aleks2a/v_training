Given /^I navigate to USPS page$/ do
  usps.home_page.visit
end

When /^I click on Register\/Sign in button$/ do
  usps.home_page.register_signin.click
end

Then (/^I type "(.*?)" as a login and "(.*?)" as a password$/) do |login, password|
  usps.signin_page.send_login login
  usps.signin_page.send_password password
  usps.signin_page.sign_in_button.click
end

Then (/^I should see "(.*?)" in login section$/) do |name|
  usps.home_page.register_signin.text.should == name
end

When (/^I will click on Sign Out$/) do
  usps.home_page.signout_click
end

