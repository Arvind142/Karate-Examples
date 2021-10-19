Feature: Api Key :) and scenarios

Background:
	* url 'https://gorest.co.in/public/v1'
	* def token = 'Bearer f8e57825938af7932c9fab447f781c73b2a90c5d65229fa61597e24a171fcc2c'
	* def RandomEmailGenerator = Java.type('com.prac.Practice._18oct.RandomEmailGenerator')
	* def emailid = RandomEmailGenerator.getEmailId()
	
	@getUser @ignore
	Scenario: getUser
		Given path 'users',id
		When method get
		Then status 200
		And match response.data.email == email
	
	@createUser @ignore
	Scenario: createUser
	* def feature = read ('baseFeature.feature@getUser')
	* def requestBody = {"name": "Tenali Ramakrishna","gender": "male","email": "#(emailid)","status": "active"}
		Given path 'users'
		And request requestBody
		And header Authorization = token
		When method post
		Then status 201
		And print response
		And match response.data.id == '#present'
		And match response.data.email == '#(emailid)'
		And def id = response.data.id
		And call feature {id : '#(id)', email: '#(emailid)'}
		And print response
		
	@updateUser @ignore
	Scenario: updateUser
	* def createUser = read ('baseFeature.feature@createUser')
	* def result = call createUser
	* def getUser = read ('baseFeature.feature@getUser')
	* def requestBody = {"name": "Tenali Ramakrishna","email": "#(emailid)","status": "active"}
		Given path 'users',result.id
		And request requestBody
		And header Authorization = token
		When method patch
		Then status 200
		And match response.data.id == '#present'
		And match response.data.email == '#(emailid)'
		And def id = result.id
		And def emailid = emailid
		And call getUser {id : '#(id)', email: '#(emailid)'}
		And print response
		
	@deleteUser @ignore
	Scenario: deleteUser
	* def createUser = read ('baseFeature.feature@createUser')
	* def result = call createUser
	* def getUser = read ('baseFeature.feature@getUser')
		Given path 'users',result.id
		And header Authorization = token
		When method delete
		Then status 204
		#validate if deleted
		And path 'users',result.id
		When method get
		Then status 404
		And match response.data.message == "Resource not found"