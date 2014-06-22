Feature: Learning API

  Scenario Outline: Parse response and show temperature
    Given I do API request for city ID <city_id>
    Given I parse API response
    Then I print city name and humidity

  Examples:
  | city_id |
  | 5391959 |
  | 2643743 |
  | 2988507 |
