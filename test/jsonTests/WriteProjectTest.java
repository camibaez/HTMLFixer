/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonTests;

import core.file.Cleaner;
import core.file.FilePrototype;
import core.rules.ReplaceText;
import core.rules.Rule;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import main.Project;
import main.ProjectAdministration;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author cbaez
 */
public class WriteProjectTest {

    public WriteProjectTest() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
    @Test
    public void createTestProject() throws FileNotFoundException {
        Rule[] rules = {
            new ReplaceText("juan.*perez", "jape", Pattern.CASE_INSENSITIVE),
            new ReplaceText("tes?1", "tesas")
        };
        Cleaner cleaner = new Cleaner(Arrays.asList(rules));
        FilePrototype proto = new FilePrototype("*.jsp", Arrays.asList("casa"));
        Project project = new Project(proto, Arrays.asList(cleaner, cleaner));

        ProjectAdministration.saveProject(project, "conf\\test1.json");

    }
    
    @Test
    public void readTestProject(){
        Project project = ProjectAdministration.loadProject("conf\\test1.json");
    }
}
