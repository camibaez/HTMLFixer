/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import core.file.Cleaner;
import core.file.FilePrototype;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author cbaez
 */
public class Project {
    protected String name;
    protected String description;
    protected FilePrototype prototype;
    protected List<Cleaner> cleaners;

    public Project(FilePrototype prototype, List<Cleaner> cleaners) {
        this.prototype = prototype;
        this.cleaners = cleaners;
    }
    
    public Project(){
        this(new FilePrototype("", new LinkedList<>()), new LinkedList<>());
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
    
    
}
