/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonTests;

import core.file.FileMatcher;
import core.file.FileProcessor;
import core.file.FilePrototype;
import core.file.Profile;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.util.Set;
import main.ProjectAdministration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author cbaez
 */
public class BigChangeTest extends HTMLTest{
    
   Profile profile;
    String workspace;
    String projectPath;

    @Before
    public void setUp() throws IOException {
        projectPath = getTestPath() + "proj1.json";
        workspace = getTestPath() + "files";
        profile = ProjectAdministration.loadProject(projectPath);

        FileMatcher finder = new FileMatcher(profile);
        Files.walkFileTree(Paths.get(workspace), finder);
    }
    
    @Test
    public void findReplaceTest() throws Exception {
        FileProcessor processor = new FileProcessor(profile, profile.getCleaners());
        processor.processAll();

    }
}
