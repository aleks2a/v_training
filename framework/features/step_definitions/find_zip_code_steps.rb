Given /^I navigate to Find Zip Code page$/ do
  usps.find_zip_code_page.visit
end

Then /^I will print in terminal available states$/ do
  usps.find_zip_code_page.print_available_states
end