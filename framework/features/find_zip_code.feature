@zip_code
Feature: Find zip code by address

  Scenario: Print available states from drop down menu
    Given I navigate to Find Zip Code page
    And I will print in terminal available states

  Scenario Outline: Find zip Code for multiple cities
    Given I navigate to Find Zip Code page
    When I type "<street>" as street address
    Then I type "<city>" as city
    And I will select "<state>" state
    Then click Find button
    And I should get my zip code "<zip_code>"
  Examples:
    | street                | city         | state                     | zip_code |
    | 1044 Middlefield Road | Redwood City | CA - California           | 94063    |
    | 1600 Pennsylvania Ave | Washington   | DC - District of Columbia | 20500    |
    | 3600 S Las Vegas Blvd | Las Vegas    | NV - Nevada               | 89109    |