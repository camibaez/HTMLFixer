/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.file;

import java.io.File;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author cbaez
 */
public class FileCentral {
    private LinkedList<File> matchedFiles = new LinkedList<>();

    public List<File> getMatchedFiles() {
        return matchedFiles;
    }

    public void setMatchedFiles(LinkedList<File> matchedFiles) {
        this.matchedFiles = matchedFiles;
    }
    

}
