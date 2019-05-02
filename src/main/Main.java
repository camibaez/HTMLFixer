/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import core.file.Cleaner;
import core.file.FileCentral;
import core.file.FileMatcher;
import core.file.FileProcessor;
import core.file.FilePrototype;
import core.rules.ReplaceText;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.LinkedList;
import core.rules.Rule;
import java.nio.file.Files;
import java.nio.file.Paths;
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
        System.out.println("HTMLFixer v0.1");
        System.out.println("Run project (run $projectname)");

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        while (true) {
            System.out.print(">");
            String command = reader.readLine().trim();
            if (command.equalsIgnoreCase("exit")) {
                return;
            } else if (command.startsWith("run ")) {
                String projectName = command.substring(command.lastIndexOf(" ")).trim();

                Project project = ProjectAdministration.loadProject("conf\\" + projectName + ".json");
                System.out.println(">Last working directory: " + project.getLastWorkingDirectory());
                System.out.print(">Enter working directory\n>");
                String path = reader.readLine().trim();
                if (path.isEmpty()) {
                    path = project.getLastWorkingDirectory();
                }
                project.setWorkingDirectory(path);
                FileMatcher finder = new FileMatcher(new FileCentral(), project.getPrototype());
                Files.walkFileTree(Paths.get(path), finder);
                finder.getFileCentral().getMatchedFiles().forEach(f -> {
                    System.out.println(f.getAbsolutePath());
                });

                new FileProcessor(finder.getFileCentral(), project.getCleaners()).processFiles();
                System.out.println("Files processed");

            } else {
                System.out.println("Unknown command '" + command + "'");
            }
        }

        //ProjectAdministration.saveProject(project, "conf\\clenaer1.json");
    }

    protected static void loadProjectMode(BufferedReader reader) throws IOException {
        /*
         System.out.println(">Enter project path");
         String projectPath = reader.readLine().trim();
         Project project = ProjectAdministration.loadProject(projectPath);
        
         System.out.println(">Enter files path");
         String path = reader.readLine().trim();
         FileMatcher finder = new FileMatcher(new FileCentral(), project.getPrototype());
         Files.walkFileTree(Paths.get(path), finder);
         System.out.println(finder.getFileCentral().getMatchedFiles().toString());

         new FileProcessor(finder.getFileCentral(), project.getCleaners()).processFiles();
         */
    }

    public static void createProjectMode(BufferedReader reader) throws IOException {
        System.out.println(">Enter extensions (coma sepearated, no spaces, no leading period) ex: jsp,html");
        String extensions = reader.readLine().toLowerCase().trim();


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

    }
}
