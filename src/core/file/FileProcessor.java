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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author cbaez
 */
public class FileProcessor {
    protected int processed;
    
    
    protected FileCentral fileCentral;
    private List<Cleaner> cleaners;

    public FileProcessor(FileCentral fileCentral, List<Cleaner> cleaners) {
        this.fileCentral = fileCentral;
        this.cleaners = cleaners;
    }

    public String processFile(File file) throws IOException {
        Object result = new String(Files.readAllBytes(file.toPath()));
        for(Cleaner cleaner: cleaners){
             result = cleaner.clean(result);
        }
        
        return TypeTransformer.transformForType(String.class, result);
    }

    public void processFiles() {
        for (File f : fileCentral.getMatchedFiles()) {
            try {
                String result = processFile(f);
                //System.out.println(result);
                
                saveFile(result, f);
                processed++;

            } catch (IOException ex) {
                Logger.getLogger(FileProcessor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void saveFile(String result, File f) throws FileNotFoundException, IOException {
        try (BufferedWriter writer = new BufferedWriter(
                new OutputStreamWriter(new FileOutputStream(f), StandardCharsets.UTF_8)
        )) {
            writer.write(result);
        }
    }

    public FileCentral getFileCentral() {
        return fileCentral;
    }

    public void setFileCentral(FileCentral fileCentral) {
        this.fileCentral = fileCentral;
    }

    public List<Cleaner> getCleaners() {
        return cleaners;
    }

    public void setCleaners(List<Cleaner> cleaners) {
        this.cleaners = cleaners;
    }

    public int getProcessed() {
        return processed;
    }
    
    

}
