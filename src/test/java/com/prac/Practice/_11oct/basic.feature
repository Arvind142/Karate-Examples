Feature: Oct-11

  #Background(Before-Each/Before Scenario/Before Test)
  Background: 
  * url 'https://jsonplaceholder.typicode.com'
 # * def payload = call read ('com/prac/Practice/_11oct/basic_external.feature');
  @subFeatureSameFeature @ignore
  Scenario: subFeature demo
  Given print 'Same class feature call'
  
  
  #Calling same class feature with tag
  @Oct11 @WithoutPram @sameClassFeatureCalling
  Scenario: calling featureFile Example
  * call read('basic.feature@subFeatureSameFeature')
  	Given print 'Same feature scenario call works'
  	
  	#Calling same class feature with tag
  @Oct11 @WithoutPram @OtherClassFeatureCalling
  Scenario: calling featureFile Example
  #defining feature
  * def feature = read ('basic_external.feature@external-feature')
  # executing it
  * def result = call feature
  	Given print 'External feature scenario call works'
  	
  	
  #calling feature without parameter and getting data out of it for validtion
  @Oct11 @WithoutPram @OtherClassFeatureCalling
  Scenario: callign feature file with param and validating results
  #defining feature
  * def feature = read ('param_external.feature')
  * def response = call feature
  * print response
  	Given match response.response.name == 'Leanne Graham'
  
  