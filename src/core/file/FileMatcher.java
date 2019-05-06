/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.file;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.FileVisitResult;
import static java.nio.file.FileVisitResult.CONTINUE;
import java.nio.file.Path;
import java.nio.file.PathMatcher;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * A {@code FileVisitor} that finds all files that match the specified pattern.
 */
public class FileMatcher extends SimpleFileVisitor<Path> {

    private final PathMatcher matcher;
    protected FileCentral fileCentral;

    private final FilePrototype filePrototype;

    public FileMatcher(FileCentral fileCentral, FilePrototype prototype) {
        this.fileCentral = fileCentral;
        filePrototype = prototype;
        matcher = FileSystems.getDefault().getPathMatcher("glob:" + filePrototype.getExtensions());
    }

    protected boolean checkFileName(Path file) {
        Path name = file.getFileName();
        return name != null && matcher.matches(name);
    }

    protected boolean checkContent(Path file) throws IOException {
        if(filePrototype.expressions == null || filePrototype.expressions.isEmpty())
            return true;
        List<ConditionalPattern> expressions = new LinkedList<>(filePrototype.getExpressions());

        try (BufferedReader reader = new BufferedReader(new FileReader(file.toFile()))) {
            String line = reader.readLine();
            while (line != null && expressions.size() > 0) {
                Iterator<ConditionalPattern> iterator = expressions.iterator();
                while (iterator.hasNext()) {
                    ConditionalPattern p = iterator.next();
                    int res = p.matches(line);
                    if(res == -1)
                        iterator.remove();
                    if(res == 1)
                        iterator.remove();
                }
                // read next line
                line = reader.readLine();
            }
        }
        
        boolean failed = false;
        for(ConditionalPattern p: filePrototype.getExpressions()){
            failed |= (p.finalState() == -1);
            p.restart();
        }
        
        
        return !failed;
    }

    // Invoke the pattern matching
    // method on each file.
    @Override
    public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) {
        try {
            if (!filePrototype.extensions.isEmpty() && !checkFileName(file))
                return CONTINUE;
            if(!filePrototype.expressions.isEmpty() && !checkContent(file))
                return CONTINUE;

            fileCentral.getMatchedFiles().add(file.toFile());
        } catch (IOException ex) {
            Logger.getLogger(FileMatcher.class.getName()).log(Level.SEVERE, null, ex);
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

    public FileCentral getFileCentral() {
        return fileCentral;
    }
}
