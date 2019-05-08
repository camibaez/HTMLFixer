/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.file;

import core.rules.TypeTransformer;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author cbaez
 */
public class FileProcessor {

    protected int processedCount;
    protected Profile project;
    private List<Cleaner> cleaners;

    public FileProcessor(Profile project, List<Cleaner> cleaners) {
        this.project = project;
        this.cleaners = cleaners;
    }

    public String processFile(Path file) throws IOException {
        Object result = null;
        for (Cleaner cleaner : cleaners) {
            if (cleaner.getPrototype() != null && !project.getFileCentral().belongsTo(cleaner.getPrototype(), file)) {
                continue;
            }
            if (result == null) {
                result = new String(Files.readAllBytes(file));
            }
            result = cleaner.clean(result);

        }
        if (result == null) {
            return "";
        }
        return TypeTransformer.transformForType(String.class, result);
    }

    public void processFiles() {
        for (Path f : project.getFileCentral().getMatchedFiles()) {
            try {
                String result = processFile(f);

                saveFile(result, f);
                processedCount++;

            } catch (IOException ex) {
                Logger.getLogger(FileProcessor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void saveFile(String result, Path p) throws FileNotFoundException, IOException {
        File f = p.toFile();
        try (BufferedWriter writer = new BufferedWriter(
                new OutputStreamWriter(new FileOutputStream(f), StandardCharsets.UTF_8)
        )) {
            writer.write(result);
        }
    }

    public List<Cleaner> getCleaners() {
        return cleaners;
    }

    public void setCleaners(List<Cleaner> cleaners) {
        this.cleaners = cleaners;
    }

    public int getProcessed() {
        return processedCount;
    }

}
