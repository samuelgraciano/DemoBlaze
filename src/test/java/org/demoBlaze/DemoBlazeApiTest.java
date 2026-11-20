package org.demoBlaze;

import com.intuit.karate.junit5.Karate;

class DemoBlazeApiTest {

    @Karate.Test
    Karate demoBlazeApi() {
        return Karate.run("classpath:features/demoblaze.feature");
    }
}
