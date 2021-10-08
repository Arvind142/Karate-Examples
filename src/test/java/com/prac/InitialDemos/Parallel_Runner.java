package com.prac.InitialDemos;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class Parallel_Runner {

	@Test
	void testParallel() {
		// below line is used to point out where we have feature with path method, only package name is good
		
		Results results = Runner.path("classpath:com.prac.InitialDemos")
				// .outputCucumberJson(true)
				.parallel(5);
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
	}

}
