package com.prac.Practice.oct9.get.basic;

import com.intuit.karate.junit5.Karate;

class Junit5_UsersRunner {

	@Karate.Test
	Karate testUsers() {
		//run all cases from featurefile name give in run method present in same package
		return Karate.run("users").relativeTo(getClass());
	}
}
