package com.prac.Runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.testng.Assert.assertEquals;
import org.testng.annotations.Test;

class TestRunner {
	@Test
	void testParallel() {
		Results results = Runner.path("classpath:com/prac").tags("Oct18").parallel(2);
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
	}
}
