Feature: Learning!

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: get first user and validate name - GET as query parameter and path parameter
  
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
    And match response.name == 'Leanne Graham'
    
    
    #url created would be '/users'(path) & '?id=1'(param) appended to url mentioned in background (i.e. https://jsonplaceholder.typicode.com/users?id=1)
    #to get response we use response word and we can (.) dot operator to access field of specific json response(i.e. response.id would consider previous response as response paylaod and get id method)
    Given path 'users'
    And param id = response.id 
    And param name = response.name
    #get request
    When method get
    #validate status code as 200
    Then status 200
    #validate response contains one field with key as name and value as 'Leanne Graham'
    And match response[0].name == 'Leanne Graham'
    
    
    
  #creatign post request to add user and validate resonse
  Scenario: Scenario 2 :) POST method and Matches
  * def jsonPayload = {'name':'Demon Knight :)'}
  * print 'json Payload:', jsonPayload
    Given path 'users'
    #request {(json Payload)} is your json body which would be sent to uri on post
    And request jsonPayload
    And print 'request:', jsonPayload
    #method post
    When method post
    #201 states created 
    Then status 201
    #printing response
    And print 'my response: ', response
    #payload comparison with response content TYPE match
    And match response == {'id':'#notnull','name':'#present'}
    #payload comparison with response content EXACT match with constant value
    And match response == {'id':11,'name':'Demon Knight :)'}
    #payload comparison with response content EXACT match with expected from injected json/response
    And print 'the value of id field in response payload is:', response.id
    And print 'the value of name field in json payload is:', jsonPayload.name
    And match response == {'id':'#(response.id)','name':'#(jsonPayload.name)'}
    
    
    
    
