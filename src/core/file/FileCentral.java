/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.file;

import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author cbaez
 */
public class FileCentral{
    protected Profile project;
    protected Map<FilePrototype, Set<Path>> prototypeFileMap;

    
    public FileCentral(Profile project){
        this.project = project;
        prototypeFileMap = new HashMap<>();
    }
    
    public void addFilePrototype(FilePrototype p){
        if(!prototypeFileMap.containsKey(p))
            prototypeFileMap.put(p, new TreeSet<>());
         
    }
    
    public void linkFileToPrototype(FilePrototype p, Path f){
       prototypeFileMap.get(p).add(f);
    }

    
    public Set<Path> getMatchedFiles() {
        return prototypeFileMap.get(project.getPrototype());
    }
    
    public boolean belongsTo(FilePrototype prototype, Path f){
        return prototypeFileMap.get(prototype).contains(f);
    }
    
    public Map<FilePrototype, Set<Path>> getPrototypeFileMap() {
        return prototypeFileMap;
    }

    
}
