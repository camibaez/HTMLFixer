/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import core.file.Profile;
import core.file.Cleaner;
import core.file.FilePrototype;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;

import java.util.List;
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

    public static void saveProject(Profile project, String path) throws FileNotFoundException {

        JSONObject jo = new JSONObject();

        jo.put("name", project.getName());
        jo.put("description", project.getDescription());
        jo.put("lastWorkingDirectory", project.getWorkingDirectory());
        jo.put("prototypes", ProjectWriter.writePrototypes(project.getPrototypesMap()));

        JSONArray cleanersArray = new JSONArray();
        for (Cleaner cleaner : project.getCleaners()) {
            JSONArray rules = new JSONArray();
            cleaner.getRules().forEach(rule -> {
                rules.add(ProjectWriter.writeRule(rule));
            });

            cleanersArray.add(ProjectWriter.writeCleaner(cleaner, rules));
        }
        jo.put("cleaners", cleanersArray);

        try (PrintWriter pw = new PrintWriter(path)) {
            pw.write(jo.toJSONString());
            pw.flush();
        }

    }

    public static Profile loadProject(String path) {
        JSONParser parser = new JSONParser();

        try (Reader reader = new FileReader(path)) {
            JSONObject jsonObject = (JSONObject) parser.parse(reader);
            
            Profile project = ProjectReader.readProject(jsonObject);
            project.setPrototypesMap(ProjectReader.readPrototypes(jsonObject));
            

            List<Cleaner> cleaners = ProjectReader.readCleaners(jsonObject);
            project.setCleaners(cleaners);

            return project;

        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException ex) {
            Logger.getLogger(ProjectAdministration.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }
}
