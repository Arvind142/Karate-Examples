Feature: Sample get-Name

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: get first user and validate name - GET as query parameter
  
    #url created would be '/users' appended to url mentioned in background (i.e. https://jsonplaceholder.typicode.com/users)
    Given path 'users'
    #get request
    When method get
    #validate status code as 200
    Then status 200
    
    
    #url created would be '/users' & '/1' appended to url mentioned in background (i.e. https://jsonplaceholder.typicode.com/users/1)
    #to get response we use response word and if we have multiple payloads we use [index(starts with 0)], we can use (.) dot operator to access field of specific json response
    Given path 'users',response[0].id 
    #get request
    When method get
    #validate status code as 200
    Then status 200
    #validate response contains one field with key as name and value as 'Leanne Graham'
    And response.name == 'Leanne Graham'
