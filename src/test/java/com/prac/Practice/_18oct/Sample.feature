Feature: Oct-18

#create/update/delete type :)
	@Oct18
	Scenario: createUser
	* def feature = read ('baseFeature.feature@createUser')
	Given call feature
	
	@Oct18
	Scenario: updateUser
	* def update = read ('baseFeature.feature@updateUser')
	Given def response = call update
	And print response
	
	@Oct18
	Scenario: updateUser
	* def delete = read ('baseFeature.feature@deleteUser')
	Given def response = call delete
	And print response