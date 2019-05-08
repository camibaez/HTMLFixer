/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonTests;

import core.file.FileMatcher;
import core.file.FileProcessor;
import core.file.FilePrototype;
import java.nio.file.Files;
import java.nio.file.Paths;
import core.file.Profile;
import java.io.IOException;
import java.nio.file.Path;
import java.util.Map;
import java.util.Set;
import main.ProjectAdministration;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;

/**
 *
 * @author cbaez
 */
public class ReplaceTest extends HTMLTest {

    Profile profile;
    String workspace;
    String projectPath;

    @Before
    public void setUp() throws IOException {
        projectPath = getTestPath() + "replaceTest.json";
        workspace = getTestPath() + "files";
        profile = ProjectAdministration.loadProject(projectPath);

        FileMatcher finder = new FileMatcher(profile);
        Files.walkFileTree(Paths.get(workspace), finder);
    }

    @Test
    public void findReplaceTest() throws Exception {
        assertEquals(2, profile.getFileCentral().getMatchedFiles().size());

        Map<FilePrototype, Set<Path>> prototypeFileMap = profile.getFileCentral().getPrototypeFileMap();
        System.out.println(profile.getPrototypesMap());

        FilePrototype p = profile.getPrototypesMap().get("base");
        assertNotNull(p);
        assertEquals(2, prototypeFileMap.get(p).size());

        p = profile.getPrototypesMap().get("excluder");
        assertNotNull(p);
        assertEquals(1, prototypeFileMap.get(p).size());
        
        FileProcessor processor = new FileProcessor(profile, profile.getCleaners());
        processor.processFiles();

    }

   
}
