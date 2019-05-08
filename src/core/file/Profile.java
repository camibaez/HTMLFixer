/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.file;

import java.util.List;
import java.util.Map;

/**
 *
 * @author cbaez
 */
public class Profile {
    protected String name;
    protected String description;
    protected String lastWorkingDirectory;
    protected String workingDirectory;
    protected FilePrototype prototype;
    protected Map<String, FilePrototype> prototypesMap;
    protected List<Cleaner> cleaners;
    protected FileCentral fileCentral;

    public Profile(FilePrototype prototype, List<Cleaner> cleaners) {
        this.prototype = prototype;
        this.cleaners = cleaners;
        this.fileCentral = new FileCentral(this);
    }
    
    public Profile(){
        this.fileCentral = new FileCentral(this);
    }

    public FilePrototype getPrototype() {
        return prototype;
    }

    public void setPrototype(FilePrototype prototype) {
        this.prototype = prototype;
    }

    public List<Cleaner> getCleaners() {
        return cleaners;
    }

    public void setCleaners(List<Cleaner> cleaners) {
        this.cleaners = cleaners;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLastWorkingDirectory() {
        return lastWorkingDirectory;
    }

    public void setLastWorkingDirectory(String lastWorkingDirectory) {
        this.lastWorkingDirectory = lastWorkingDirectory;
    }

    public String getWorkingDirectory() {
        return workingDirectory;
    }

    public void setWorkingDirectory(String workingDirectory) {
        this.workingDirectory = workingDirectory;
    }

    public Map<String, FilePrototype> getPrototypesMap() {
        return prototypesMap;
    }

    public void setPrototypesMap(Map<String, FilePrototype> prototypeMap) {
        this.prototypesMap = prototypeMap;
        this.prototype = this.prototypesMap.get("base");
    }

    public FileCentral getFileCentral() {
        return fileCentral;
    }
    
    
    
}
