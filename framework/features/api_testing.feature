@api
Feature: Learning API testing

  Scenario Outline: Parse response and show temperature
    Given I make an API request for city ID <city_id>
    Then I parse API response
    And I print "<city_name>" name and humidity

  Examples:
  | city_id | city_name     |
  | 5391959 | San Francisco |
  | 2643743 | London        |
  | 2988507 | Paris         |

  Scenario: API should throw friendly error when user supply incorrect city ID
    Given I make an API request for city ID INCORRECT
    Then I parse API response
    Then I should get response with key and values
    | message | Error: Not found city |
    | cod     | 404                   |
