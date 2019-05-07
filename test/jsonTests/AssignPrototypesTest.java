/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonTests;

import core.file.Cleaner;
import core.file.FilePrototype;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import core.file.Profile;
import main.ProjectAdministration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author cbaez
 */
public class AssignPrototypesTest extends HTMLTest{
    Profile project;
    
    
    @Before
    public void setUp() {
        project = ProjectAdministration.loadProject(getTestBase() + "baseProject.json");
    }
    
    @Test
    public void prototypesCountTest(){
        Map<String, FilePrototype> map = project.getPrototypesMap();
        assertEquals(2, map.keySet().size());
        assertTrue(map.keySet().containsAll(Arrays.asList("base", "excluder")));
        assertNotNull(project.getPrototype());      
    }
    
    @Test
    public void cleanersCountTest(){
        List<Cleaner> cleaners = project.getCleaners();
        Map<String, Cleaner> cleanersMap = new HashMap<>();
        cleaners.forEach(c -> cleanersMap.put(c.getId(), c));
        Map<String, FilePrototype> prototypesMap = project.getPrototypesMap();
        
        assertEquals(3, cleaners.size());
        
        assertNull(cleanersMap.get("c1").getPrototype());
        assertSame(prototypesMap.get("excluder"), cleanersMap.get("c2").getPrototype());
        assertSame(prototypesMap.get("excluder"), cleanersMap.get("c3").getPrototype());
    }
}
