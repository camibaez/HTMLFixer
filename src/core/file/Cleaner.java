/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.file;

import java.util.List;
import core.rules.Rule;

/**
 *
 * @author cbaez
 */
public class Cleaner {

    protected String id ="";
    protected String description ="";

    protected List<Rule> rules;

    public Cleaner(List<Rule> rules) {
        this.rules = rules;
    }

    public List<Rule> getRules() {
        return rules;
    }

    public Object clean(Object content) {
        for (Rule rule : rules) {
            content = rule.process(content);
        }
        return content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String toString(){
        return id + " " + description;
    }
}
