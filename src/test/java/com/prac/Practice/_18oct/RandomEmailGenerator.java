package com.prac.Practice._18oct;

public class RandomEmailGenerator {
	public static String getEmailId() {
		return "rappox_ultimate_" + (Math.random() * 1000) + "@trax.com";
	}

	public static String getEmailId(String prefix) {
		return prefix + "_" + (Math.random() * 1000) + "@trax.com";
	}
}