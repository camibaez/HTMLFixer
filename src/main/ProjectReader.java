/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import core.file.Cleaner;
import core.file.ConditionalPattern;
import core.file.FilePrototype;
import core.rules.ReplaceText;
import core.rules.Rule;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import jdk.nashorn.internal.runtime.PrototypeObject;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author cbaez
 */
public class ProjectReader {
    public static HashMap<String, FilePrototype> prototypesMap;
    public static Project readProject(JSONObject jsonObject) {
            Project project = new Project();
            project.setName((String) jsonObject.get("name"));
            project.setDescription((String) jsonObject.get("description"));
            project.setLastWorkingDirectory((String) jsonObject.get("lastWorkingDirectory"));
            
            return project;
        }

        public static ReplaceText readReplaceTextRule(Map ruleData) {
            String pattern = (String) ruleData.get("pattern");
            String replace = (String) ruleData.get("replace");
            int flags = ((Long) ruleData.get("flags")).intValue();
            return new ReplaceText(pattern, replace, flags);
           
        }

        public static List<Rule> readRules(JSONArray rulesData) {
            List<Rule> rules = new LinkedList<>();
            rulesData.forEach((Object rule) -> {
                String ruleClass = (String) ((Map) rule).get("ruleClass");
                if (ruleClass.equals(ReplaceText.class.getCanonicalName())) {
                    rules.add(readReplaceTextRule((Map) rule));
                }
            });
            return rules;
        }

        public static HashMap<String, FilePrototype> readPrototypes(JSONObject o){
            JSONArray prototypesData = (JSONArray) o.get("prototypes");
            List<FilePrototype> prototypes = new LinkedList<>();
            prototypesData.forEach(e -> {
                FilePrototype prototype = readPrototype((Map) e);
                prototypesMap.put(prototype.getId(), prototype);
                
            });
        }
        
        
        public static FilePrototype readPrototype(Map prototypeData) {
            String extensions = (String) prototypeData.get("extensions");
            List<ConditionalPattern> expressions = new LinkedList<>();
            JSONArray expressionsData = (JSONArray) prototypeData.get("expressions");
            expressionsData.forEach((Object e) -> {
                Map map = (Map) e;
                String condition = (String) map.get("condition");
                String pattern = (String) map.get("pattern");
                int flags = ((Long) map.get("flags")).intValue();
                expressions.add(ConditionalPattern.compile(pattern, flags, condition));
                       
            });
            FilePrototype prototype = new FilePrototype(extensions, expressions);
            prototype.setId((String) prototypeData.get("id"));
            return prototype;
        }

        public static List<Cleaner> readCleaners(JSONObject json) {
            List<Cleaner> cleaners = new LinkedList<>();
            JSONArray cleanersData = (JSONArray) json.get("cleaners");
            cleanersData.forEach((Object c) -> {
                String id = (String) ((Map) c).get("id");
                String desc = (String) ((Map) c).get("description");
                JSONArray rulesData = (JSONArray) ((Map) c).get("rules");
                List<Rule> rules = readRules(rulesData);
                
                Cleaner cleaner = new Cleaner(rules);
                cleaner.setId(id);
                cleaner.setDescription(desc);
                String prototypeId = (String) ((Map)c).get("prototype");
                if(prototypeId != null)
                    cleaner.setPrototype(prototypesMap.get(prototypeId));
                cleaners.add(cleaner);
                
                
            });
            return cleaners;
        }
}
