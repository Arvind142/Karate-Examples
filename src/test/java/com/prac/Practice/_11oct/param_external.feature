Feature: Oct-11

  #Background(Before-Each/Before Scenario/Before Test)
  Background: 
  * url 'https://jsonplaceholder.typicode.com'
  
  @SubFeature @external-Feature @WithoutPram
  Scenario: calling featureFile Example
  	Given path 'users','1'
  	When method get
  	Then status 200
  	And print response
  
  
    @SubFeature @external-Feature @WithPram
  Scenario: calling featureFile Example
  	Given path uri,pageNo
  	When method get
  	Then status 200
  	And print response