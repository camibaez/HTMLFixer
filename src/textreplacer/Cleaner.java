/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package textreplacer;

import java.util.List;
import textreplacer.rules.Rule;

/**
 *
 * @author cbaez
 */
public class Cleaner {
    protected List<Rule> rules;

    public Cleaner(List<Rule> rules) {
        this.rules = rules;
    }

    public List<Rule> getRules() {
        return rules;
    }
    
    public Object clean(Object content){
        for(Rule rule: rules){
            content = rule.process(content);
        }
        return content;
    }
}
