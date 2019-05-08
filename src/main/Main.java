/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import core.file.Profile;
import core.file.FileCentral;
import core.file.FileMatcher;
import core.file.FileProcessor;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 *
 * @author cbaez
 */
public class Main {

    public static void main(String[] args) throws IOException {
        //mainReal(args);
        mainTest(args);

    }

    /*
    public static void mainReal(String[] args) throws IOException {
        System.out.println("HTMLFixer v0.1");
        System.out.println("Run project (run $projectname)");

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        while (true) {
            try {
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
                    System.out.println("Starting searching");
                    long time = System.currentTimeMillis();
                    FileMatcher finder = new FileMatcher(new ProjectFileCentral(), project.getPrototype());
                    Files.walkFileTree(Paths.get(path), finder);
                    finder.getFileCentral().getMatchedFiles().forEach(f -> {
                        System.out.println(f.getAbsolutePath());
                    });
                    System.out.println("Serching ended. Matched = "
                            + finder.getFileCentral().getMatchedFiles().size()
                            + " Time = " + (System.currentTimeMillis() - time)
                    );

                    System.out.println("Wanna process? (y/n) (leave blank for no) ");
                    System.out.print(">");
                    command = reader.readLine().trim();
                    if (!command.isEmpty()) {
                        System.out.println("Starting replace");
                        time = System.currentTimeMillis();
                        FileProcessor processor = new FileProcessor(finder.getFileCentral(), project.getCleaners());
                        processor.processFiles();
                        System.out.println("Files processed. Processed = " + processor.getProcessed() + "Time = " + (System.currentTimeMillis() - time));
                    }

                } else {
                    System.out.println("Unknown command '" + command + "'");
                }
            } catch (Exception e) {
                System.out.println("Error executing the program;");
            }

        }

        //ProjectAdministration.saveProject(project, "conf\\clenaer1.json");
    }

    */
    
    public static void mainTest(String[] args) throws IOException {
        System.out.println("HTMLFixer v0.1");
        System.out.println("Run project (run $projectname)");

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        while (true) {
            try {

                String projectName = "replaceTest";

                Profile project = ProjectAdministration.loadProject("conf\\test-files\\ReplaceTest\\" + projectName + ".json");
                String path = "conf\\test-files\\ReplaceTest\\files";
                project.setWorkingDirectory(path);
                System.out.println("Starting searching");
                long time = System.currentTimeMillis();
                
               
                
                FileMatcher finder = new FileMatcher(project);
                Files.walkFileTree(Paths.get(path), finder);
                project.getFileCentral().getMatchedFiles().forEach(f -> {
                    System.out.println(f.toFile().getAbsolutePath());
                });
                System.out.println("Serching ended. Matched = "
                        + project.getFileCentral().getMatchedFiles().size()
                        + " Time = " + (System.currentTimeMillis() - time)
                );

                System.out.println("Wanna process? (y/n) (leave blank for no) ");
                System.out.print(">");
                String command = reader.readLine().trim();
                if (!command.isEmpty()) {
                    System.out.println("Starting replace");
                    time = System.currentTimeMillis();
                    FileProcessor processor = new FileProcessor(project, project.getCleaners());
                    processor.processFiles();
                    System.out.println("Files processed. Processed = " + processor.getProcessed() + "Time = " + (System.currentTimeMillis() - time));
                }

            } catch (Exception e) {
                System.out.println("Error executing the program;");
                e.printStackTrace();

            }

        }

        //ProjectAdministration.saveProject(project, "conf\\clenaer1.json");
    }
}
