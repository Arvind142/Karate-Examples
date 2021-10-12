package com.prac.Practice._12oct;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomJavaCode {

	/***
	 * static method used in feature
	 * 
	 * @param fromFeature
	 * @return
	 */
	public static String callStaticMethod(String fromFeature) {
		return "Hello, " + fromFeature;
	}

	/***
	 * Instance method, returns string
	 * 
	 * @param fromFeature
	 * @return
	 */
	public String callInstanceMethod(String fromFeature) {
		return ("Hello, " + fromFeature);

	}

	/***
	 * Instance method, returns integer
	 * 
	 * @param fromFeature
	 * @return
	 */
	public Integer callInstanceMethod(Integer fromFeature) {
		return fromFeature * 2;

	}

	/***
	 * Instance method, returns list
	 * 
	 * @param fromFeature
	 * @return
	 */
	public List<String> callInstanceMethod_List(String fromFeature) {
		List<String> list = new ArrayList<>();
		list.add("Hello, " + fromFeature);
		return list;
	}

	/**
	 * Instance method, returns map
	 * 
	 * @param fromFeature
	 * @return
	 */
	public Map<String, Object> callInstanceMethod_Map(String fromFeature) {
		Map<String, Object> map = new HashMap<>();
		map.put("someKey", "Hello, " + fromFeature);
		return map;
	}

}
