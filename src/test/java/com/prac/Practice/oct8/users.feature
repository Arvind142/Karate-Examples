Feature: Sample get-Name

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: get first user and validate name
    Given path 'users'
    When method get
    Then status 200
    
    Given path 'users','1'
    When method get
    Then status 200
    And response.name = 'Leanne Graham'
