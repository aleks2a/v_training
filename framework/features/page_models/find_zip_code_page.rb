class FindZipCodePage < PageActions

  def path
    "https://tools.BASEURL/go/ZipLookupAction!input.action"
  end

  # find element using css
  def select_state_dropdown
    @browser.find_element(:css, "span.select-current-text")
  end

  # find all elements with tag "li" under parent element with css "ul.select-ul"
  # elements will be stored in array
  def available_states_list
    @browser.find_element(:css, "ul.select-ul").find_elements(:tag_name, "li")
  end

  # printing in terminal states in dropdown menu
  # reusing methods "select_state_dropdown" and "available_states_list"
  def print_available_states
    select_state_dropdown.click
    available_states_list.each do |element|
      puts element.text
    end
  end

end