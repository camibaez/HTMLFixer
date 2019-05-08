/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonTests;

import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

/**
 *
 * @author cbaez
 */
@RunWith(Suite.class)
@Suite.SuiteClasses({jsonTests.ReadWriteTest.class, jsonTests.AssignPrototypesTest.class, jsonTests.FindTest.class, ReplaceTest.class})
public class HTMLTestSuite {

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }
    
}
