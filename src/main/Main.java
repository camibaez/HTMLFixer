/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import core.file.Cleaner;
import core.file.FilePrototype;
import core.rules.ReplaceText;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.LinkedList;
import core.rules.Rule;
import java.util.List;

/**
 *
 * @author cbaez
 */
public class Main {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        //System.out.println(">Enter path");
        //String path = reader.readLine().trim();
        String path = "C:\\Users\\cbaez\\Desktop\\Test";

        //System.out.println(">Enter extensions (coma sepearated, no spaces, no leading period) ex: jsp,html");
        //String extensions = reader.readLine().toLowerCase().trim();
        String extensions = "*.txt";

        /*
         System.out.println(">Enter expressions file must contain. Enter |finish| once you finished.");
         List<String> expressions = new ArrayList<>();
         while(true){
         String expression = reader.readLine().toLowerCase().trim();
         if(expression.equals("|finish|"))
         break;
         expressions.add(expression);
         }
        
         */
        String[] expressions = {};
        FilePrototype prototype = new FilePrototype(extensions, new LinkedList<>(Arrays.asList(expressions)));

        //FileMatcher finder = new FileMatcher(new FileCentral(), prototype);
        //Files.walkFileTree(Paths.get(path), finder);
        //System.out.println(finder.getFileCentral().getMatchedFiles().toString());

        Rule[] rules = {new ReplaceText("casa", "tasa\\-pasa\\.")};
        rules[0].setId("rule1");
        rules[0].setDescription("Rule test 1");
        
        Cleaner cleaner = new Cleaner(Arrays.asList(rules));
        cleaner.setId("Cleaner");
        cleaner.setDescription("Cleaner Description");
        //new FileProcessor(finder.getFileCentral(), cleaner).processFiles();
        
        List<Cleaner> cleaners = new LinkedList<Cleaner>();
        cleaners.add(cleaner);
        
        Project project = new Project(prototype, cleaners);
        project.setName("Proj 1");
        project.setDescription("Proj 1 desc");
        
        ProjectAdministration.saveProject(project, "conf\\clenaer1.json");
        ProjectAdministration.loadProject("conf\\clenaer1.proj.json");
    }

}
