Feature: Learning!

  Background:
    * url 'https://jsonplaceholder.typicode.com'
	@Oct9
  Scenario: get all users(/users) ->get first user(/users/id)->get first user with (user?id=value)
  
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
  
  
  #creatign post request to add user and response validation(all types of checks)
  @Oct9
  Scenario: Post payload to /users then check status code for 201 then validation of payload/field/field type validation
  * def jsonPayload = {'name':'Demon Knight', 'age': null,'isValidPassport':true}
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
    And match response == {'id':'#notnull','name':'#present','age':'#null','isValidPassport':'#boolean'}
    #field check if present for xml/json
    And match response.id == '#present'
    #field check if not present for xml/json
    And match response.status == '#notpresent'
    #field should exist and ignore validation only for json
    And match response.id == '#ignore'
    #field should hold value of number type
    And match response.id == '#number'
    #field should hold value of string type
    And match response.name == '#string'
    #field should hold value of boolean type
    And match response.isValidPassport == '#boolean'
    #field should hold null
    And match response.age == '#null'
    #field should not hold null
    And match response.id == '#notnull'
    #field regex comparion for name wher A-z and space chars are allowed
    And match response.name == '#regex [A-z ]+'
    #field comparison with condition
    And match response.id == '#? _ > 10 && _ <= 11'
    #single field validation
    And match response.name == 'Demon Knight'
    #payload comparison with response content EXACT match with constant value
    And match response == {'id':11,'name':'Demon Knight', 'age': null,'isValidPassport':true}
    #payload comparison with response content EXACT match with expected from injected json/response
    And print 'the value of id field in response payload is:', response.id
    And print 'the value of name field in json payload is:', jsonPayload.name
    And match response == {'id':'#(response.id)','name':'#(jsonPayload.name)','age':'#(jsonPayload.age)','isValidPassport':'#(jsonPayload.isValidPassport)'}
    