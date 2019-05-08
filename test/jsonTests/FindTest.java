/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonTests;

import core.file.FileMatcher;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import core.file.Profile;
import main.ProjectAdministration;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author cbaez
 */
public class FindTest extends HTMLTest{

    
    String path;

    public FindTest() {
    }

    @Before
    public void setUp() {
        path = getTestPath() + "files";
        
    }
    
    @Test
    public void findIncluding() throws IOException {
        Profile project = ProjectAdministration.loadProject(getTestPath() + "findTest.json");
        project.setWorkingDirectory(path);
        
        FileMatcher finder = new FileMatcher(project);
        Files.walkFileTree(Paths.get(path), finder);
        project.getFileCentral().getMatchedFiles().forEach(f -> {
            System.out.println(f.toFile().getAbsolutePath());
        });
        assertEquals(1, project.getFileCentral().getMatchedFiles().size());
    }
    
    
}
