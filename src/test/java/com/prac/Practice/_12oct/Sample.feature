Feature: Oct-12

	Background:
	* url 'https://jsonplaceholder.typicode.com'
	
	#Scenario-1-Calling-javaCode-staticMethod
	@Oct12
	Scenario: calling static method of javaClass
		#declaring java class
		* def CustomJavaCode = Java.type('com.prac.Practice._12oct.CustomJavaCode')
		#calling static method
		* def results = CustomJavaCode.callStaticMethod('Arvind')
		* print 'result:',results
		#validation
		Given match results == 'Hello, Arvind'
		
	
	#Scenario-2-calling-javaCode-instanceMethod
	@Oct12
	Scenario: calling instance methods of javaClass
		#declaring java class
		* def CustomJavaCode = Java.type('com.prac.Practice._12oct.CustomJavaCode')
		
		#creating object
		* def object = new CustomJavaCode()
		
		#calling Methods
				
		#calling overloaded method callInstanceMethod
		Given def result = object.callInstanceMethod('Arvind')
		And print 'result:',result
		And match result == 'Hello, Arvind'
		
		#calling overloaded method callInstanceMethod
		Given def result = object.callInstanceMethod(2)
		And print 'result:',result
		And match result == 4
		
		#calling mehod which returns list
		Given def result = object.callInstanceMethod_List('Arvind')
		And print 'result:',result
		And match result[0] == 'Hello, Arvind'
		
		#calling mehod which returns Map
		Given def result = object.callInstanceMethod_Map('Arvind')
		And print 'result:',result
		And match result.someKey == 'Hello, Arvind'
		