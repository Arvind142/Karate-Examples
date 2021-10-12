Feature: Oct-11

  #Background(Before-Each/Before Scenario/Before Test)
  Background: 
  * url 'https://jsonplaceholder.typicode.com'
  
  #calling scenario from same feature file Example without prams
  @Oct11 @WithoutPram @sameClassFeatureCalling
  Scenario: calling scenario from same feature file Example
  * call read('basic.feature@subFeatureSameFeatureWithoutPram')
  	Given print 'Same feature scenario call works'
  	
  #calling scenario from same feature file Example with prams
  @Oct11 @WithPram @sameClassFeatureCalling
  Scenario: calling scenario from same feature file Example with pram
  * call read('basic.feature@subFeatureSameFeatureWithPram') {details:'values passed from calling scenario'}
  	Given print 'Same feature scenario call works'
  	
  #calling scenario from external feature file Example
  @Oct11 @WithoutPram @OtherClassFeatureCalling
  Scenario: calling scenario from external feature file Example
  #defining feature
  * def feature = read ('basic_external.feature@external-feature')
  # executing it
  * def result = call feature
  	Given print 'External feature scenario call works'
  	
  	
  #callign scenario from external feature file and validating results
  @Oct11 @WithoutPram @OtherClassFeatureCalling
  Scenario: callign  scenario from external feature file and validating results
  #defining feature
  * def feature = read ('param_external.feature@WithoutPram')
  #calling feature 
  * def result = call feature
  #print is must
  * print result
  # as response will hold response, status and header field so to get response out of it we do response.response to get to actual response json
  	Given match result.response.name == 'Leanne Graham'
  
  
  #callign scenario from external feature file with params and validating results
  @Oct11 @WithPram @OtherClassFeatureCalling
  Scenario: callign  scenario from external feature file with params and validating results
  #defining feature
  * def feature = read ('param_external.feature@WithPram')
  #calling feature
  * def result = call feature { uri: 'users', pageNo: '1'}
  #print is must
  * print result
  # as response will hold response, status and header field so to get response out of it we do response.response to get to actual response json
  	Given match result.response.id == 1
  	
  #callable scenarios
   
  @subFeatureSameFeatureWithoutPram @ignore
  Scenario: subFeature demo
  Given print 'Same class feature call'
  
  @subFeatureSameFeatureWithPram @ignore
  Scenario: subFeature demo
  Given print 'Same class feature call with pram : ',details
  