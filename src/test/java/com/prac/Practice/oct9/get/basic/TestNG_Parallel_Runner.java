package com.prac.Practice.oct9.get.basic;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.testng.Assert.assertEquals;
import org.testng.annotations.Test;

class TestNG_Parallel_Runner {

	@Test
	void testParallel() {
		// below line is used to point out where we have feature with path method
		Results results = Runner.path("classpath:com/prac/Practice/oct9")
				// .outputCucumberJson(true)
				.parallel(5);
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
	}

}
