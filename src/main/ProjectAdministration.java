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
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author cbaez
 */
public class ProjectAdministration {

    public static class CleanerDescriptor {

        String id;
        String name;
        String description;

        public CleanerDescriptor(String id, String name, String description) {
            this.id = id;
            this.name = name;
            this.description = description;
        }
    }

    public static void saveProject(Project project, String path)
            throws FileNotFoundException {

        JSONObject jo = new JSONObject();

        jo.put("name", project.getName());
        jo.put("description", project.getDescription());
        jo.put("filePrototype", writePrototype(project.getPrototype()));

        JSONArray cleanersArray = new JSONArray();
        for (Cleaner cleaner : project.getCleaners()) {
            JSONArray rules = new JSONArray();
            cleaner.getRules().forEach(rule -> {
                rules.add(writeRule(rule));
            });

            cleanersArray.add(writeCleaner(cleaner, rules));
        }
        jo.put("cleaners", cleanersArray);

        try (PrintWriter pw = new PrintWriter(path)) {
            pw.write(jo.toJSONString());
            pw.flush();
        }

    }

    public static Project loadProject(String path) {
        JSONParser parser = new JSONParser();

        try (Reader reader = new FileReader(path)) {

            JSONObject jsonObject = (JSONObject) parser.parse(reader);
            System.out.println(jsonObject);

            Project project = readProject(jsonObject);
            FilePrototype prototype = readPrototype(jsonObject);
            List<Cleaner> cleaners = readCleaners(jsonObject);

            project.setPrototype(prototype);
            project.setCleaners(cleaners);

            return project;

        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException ex) {
            Logger.getLogger(ProjectAdministration.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
        
    }

    public static Project readProject(JSONObject jsonObject) {
        Project project = new Project();
        project.setName((String) jsonObject.get("name"));
        project.setDescription((String) jsonObject.get("description"));
        return project;
    }

    public static FilePrototype readPrototype(JSONObject jsonObject) {
        Map prototypeData = (Map) jsonObject.get("filePrototype");
        String extensions = (String) prototypeData.get("extensions");
        List<String> expressions = new LinkedList<>();
        JSONArray expressionsData = (JSONArray) prototypeData.get("expressions");
        expressionsData.forEach(e -> {
            expressions.add((String) e);

        });

        return new FilePrototype(extensions, expressions);
    }

    public static List<Cleaner> readCleaners(JSONObject json) {
        List<Cleaner> cleaners = new LinkedList<>();
        JSONArray cleanersData = (JSONArray) json.get("cleaners");
        cleanersData.forEach(c -> {
            String id = (String) ((Map) c).get("id");
            String desc = (String) ((Map) c).get("description");
            JSONArray rulesData = (JSONArray) ((Map) c).get("rules");
            List<Rule> rules = readRules(rulesData);
            Cleaner cleaner = new Cleaner(rules);
            cleaner.setId(id);
            cleaner.setDescription(desc);
            cleaners.add(cleaner);
        });

        return cleaners;
    }

    public static List<Rule> readRules(JSONArray rulesData) {
        List<Rule> rules = new LinkedList<>();
        rulesData.forEach(rule -> {
            String ruleClass = (String) ((Map) rule).get("ruleClass");
            if (ruleClass.equals(ReplaceText.class.getCanonicalName())) {
                rules.add(readReplaceTextRule((Map) rule));
            }
        });
        return rules;
    }

    public static ReplaceText readReplaceTextRule(Map ruleData) {
        String pattern = (String) ruleData.get("pattern");
        String replace = (String) ruleData.get("replace");
        return new ReplaceText(pattern, replace);
    }

    protected static Map writePrototype(FilePrototype prototype) {
        Map prototypeData = new LinkedHashMap(2);
        prototypeData.put("extensions", prototype.getExtensions());
        prototypeData.put("expressions", prototype.getExpressions());
        return prototypeData;
    }

    protected static Map writeCleaner(Cleaner cleaner, JSONArray rules) {
        Map cleanerData = new LinkedHashMap(3);
        cleanerData.put("id", cleaner.getId());
        cleanerData.put("description", cleaner.getDescription());
        cleanerData.put("rules", rules);
        return cleanerData;
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

    public static Map writeReplaceTextRule(ReplaceText rule) {
        Map ruleData = new LinkedHashMap(2);

        ruleData.put("pattern", rule.getPattern());
        ruleData.put("replace", rule.getReplace());

        return ruleData;
    }
}
