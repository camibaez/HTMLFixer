/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonTests;

import core.file.Cleaner;
import core.file.ConditionalPattern;
import core.file.FilePrototype;
import core.rules.ReplaceText;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import core.file.Profile;
import main.ProjectAdministration;
import org.junit.Test;

/**
 *
 * @author cbaez
 */
public class ReadWriteTest extends HTMLTest{
    Profile project;
    public ReadWriteTest() {
        project = ProjectAdministration.loadProject(getTestBase()+"baseProject.json");
    }   


    
    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
    @Test
    public void createTestProject() throws FileNotFoundException {
        ProjectAdministration.saveProject(project, getTestPath() + "writeProject.json");
    }
    
    
}
