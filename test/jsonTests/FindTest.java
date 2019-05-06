/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonTests;

import core.file.ConditionalPattern;
import core.file.FileCentral;
import core.file.FileMatcher;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import main.Project;
import main.ProjectAdministration;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author cbaez
 */
public class FindTest {

    Project project;
    String path;

    public FindTest() {
    }

    @Before
    public void setUp() {
        project = ProjectAdministration.loadProject("conf\\findTest.json");
        path = "conf\\test-files_2";
        project.setWorkingDirectory(path);
    }
    
    @Test
    public void findIncluding() throws IOException {
        ConditionalPattern p = ConditionalPattern.compile(".*muela.*", 0, ConditionalPattern.INCLUDE);
        project.getPrototype().getExpressions().add(p);
        System.out.println("P" + project.getPrototype().getExpressions().size());
        FileMatcher finder = new FileMatcher(new FileCentral(), project.getPrototype());
        Files.walkFileTree(Paths.get(path), finder);
        finder.getFileCentral().getMatchedFiles().forEach(f -> {
            System.out.println(f.getAbsolutePath());
        });
        assertEquals(1, finder.getFileCentral().getMatchedFiles().size());
    }
    
    
    @Test
    public void findExcluding() throws IOException {
        ConditionalPattern p = ConditionalPattern.compile(".*muela.*", 0, ConditionalPattern.EXCLUDE);
        project.getPrototype().getExpressions().add(p);
        System.out.println("P" + project.getPrototype().getExpressions().size());
        FileMatcher finder = new FileMatcher(new FileCentral(), project.getPrototype());
        Files.walkFileTree(Paths.get(path), finder);
        finder.getFileCentral().getMatchedFiles().forEach(f -> {
            System.out.println(f.getAbsolutePath());
        });
        assertEquals(2, finder.getFileCentral().getMatchedFiles().size());
    }
    
    @Test
    public void findMixed() throws IOException {
        ConditionalPattern p = ConditionalPattern.compile(".*sapotoro.*", 0, ConditionalPattern.EXCLUDE);
        project.getPrototype().getExpressions().add(p);
        p = ConditionalPattern.compile(".*rupert.*", 0, ConditionalPattern.EXCLUDE);
        project.getPrototype().getExpressions().add(p);
        System.out.println("P" + project.getPrototype().getExpressions().size());
        FileMatcher finder = new FileMatcher(new FileCentral(), project.getPrototype());
        Files.walkFileTree(Paths.get(path), finder);
        finder.getFileCentral().getMatchedFiles().forEach(f -> {
            System.out.println(f.getAbsolutePath());
        });
        assertEquals(3, finder.getFileCentral().getMatchedFiles().size());
    }
}
