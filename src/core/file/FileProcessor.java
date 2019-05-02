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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author cbaez
 */
public class FileProcessor {

    protected FileCentral fileCentral;
    private Cleaner cleaner;

    public FileProcessor(FileCentral fileCentral, Cleaner cleaner) {
        this.fileCentral = fileCentral;
        this.cleaner = cleaner;
    }

    public String processFile(File file) throws IOException {
        String read = new String(Files.readAllBytes(file.toPath()));
        Object result = cleaner.clean(read);
        return TypeTransformer.transformForType(String.class, result);
    }

    public void processFiles() {
        for (File f : fileCentral.getMatchedFiles()) {
            try {
                String result = processFile(f);
                //System.out.println(result);
                
                saveFile(result, f);

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

    public Cleaner getCleaner() {
        return cleaner;
    }

    public void setCleaner(Cleaner cleaner) {
        this.cleaner = cleaner;
    }

}
