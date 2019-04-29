/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package textreplacer;

import textreplacer.rules.HtmlRule;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.FileVisitResult;
import static java.nio.file.FileVisitResult.CONTINUE;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.PathMatcher;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * A {@code FileVisitor} that finds all files that match the specified pattern.
 */
public class Finder extends SimpleFileVisitor<Path> {
    private final PathMatcher matcher;
    private List<File> matchedFiles;
    
    private final FilePrototype filePrototype;
    private Cleaner cleaner;
    
    private int countMatched = 0;
    private int countSkipped = 0;

    Finder(FilePrototype prototype, Cleaner cleaner) {
        filePrototype = prototype;
        matcher = FileSystems.getDefault().getPathMatcher("glob:" + filePrototype.getExtensions());
        this.cleaner = cleaner;

    }

    protected boolean checkFileName(Path file) {
        Path name = file.getFileName();
        return name != null && matcher.matches(name);

    }

    protected boolean checkContent(Path file) throws IOException {
        List<String> expressions = new LinkedList<String>(filePrototype.getExpressions());

        BufferedReader reader = new BufferedReader(new FileReader(file.toFile()));
        String line = reader.readLine();
        while (line != null && expressions.size() > 0) {
            final String value = line;
            expressions.removeIf(e -> value.contains(e));

            // read next line
            line = reader.readLine();
        }
        reader.close();
        return expressions.isEmpty();
    }

    

    // Invoke the pattern matching
    // method on each file.
    @Override
    public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) {
        try {
            if (!checkFileName(file) || !checkContent(file)) {
                countSkipped++;
                return CONTINUE;
            }
            
            matchedFiles.add(file.toFile());
            
            
            String res = processFile(file);
            System.out.println(res);
            
        } catch (IOException ex) {
            Logger.getLogger(Finder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return CONTINUE;
    }

    // Invoke the pattern matching
    // method on each directory.
    @Override
    public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) {
        //find(dir);
        return CONTINUE;
    }

    @Override
    public FileVisitResult visitFileFailed(Path file, IOException exc) {
        System.err.println(exc);
        return CONTINUE;
    }
    
    
    // Prints the total number of
    // matches to standard out.
    public void done() {
        System.out.println("Matched: " + countMatched);
    }
    
    
    
    public String processFile(Path file) throws IOException{
       String read = new String ( Files.readAllBytes( file ) );
       Object result = cleaner.clean(read);
       return (String) result;
       
       
    }
}
