/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import core.file.Cleaner;
import core.file.FilePrototype;
import core.rules.ReplaceText;
import core.rules.Rule;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author cbaez
 */
public class ProjectWriter {
    
    
    
     protected static Map writePrototype(FilePrototype prototype) {
            Map prototypeData = new LinkedHashMap(2);
            prototypeData.put("extensions", prototype.getExtensions());
            prototypeData.put("expressions", prototype.getExpressions());
            return prototypeData;
        }

        public static Map writeRule(Rule rule) {
            Map ruleData = null;
            if (rule instanceof ReplaceText) {
                ruleData = writeReplaceTextRule((ReplaceText) rule);
            }
            if (ruleData != null) {
                ruleData.put("ruleClass", ReplaceText.class.getCanonicalName());
            }
            return ruleData;
        }

        protected static Map writeCleaner(Cleaner cleaner, JSONArray rules) {
            Map cleanerData = new LinkedHashMap(3);
            cleanerData.put("id", cleaner.getId());
            cleanerData.put("description", cleaner.getDescription());
            cleanerData.put("rules", rules);
            return cleanerData;
        }

        public static Map writeReplaceTextRule(ReplaceText rule) {
            Map ruleData = new LinkedHashMap(3);
            ruleData.put("pattern", rule.getPattern());
            ruleData.put("replace", rule.getReplace());
            ruleData.put("flags", rule.getFlags());
            return ruleData;
        }
}
