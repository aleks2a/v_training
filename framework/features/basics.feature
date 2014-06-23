Feature: beginners scenarios

  Scenario: Open web browser with USPS website
    Given I navigate to USPS page
    When I click on Register/Sign in button
    And I type "bayqatraining@gmail.com" as a login and "root1234" as a password
    Then I should see "Hi, Aleks" in login section
#    When I will click on Sign Out
#    Then I should see "Register / Sign In" in login section


