/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package textreplacer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author cbaez
 */
public class Main {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        //System.out.println(">Enter path");
        //String path = reader.readLine().trim();
        String path = "C:\\Users\\cbaez\\Desktop\\TestFolder";

        //System.out.println(">Enter extensions (coma sepearated, no spaces, no leading period) ex: jsp,html");
        //String extensions = reader.readLine().toLowerCase().trim();
        String extensions = "*.jsp";

        /*
         System.out.println(">Enter expressions file must contain. Enter |finish| once you finished.");
         List<String> expressions = new ArrayList<>();
         while(true){
         String expression = reader.readLine().toLowerCase().trim();
         if(expression.equals("|finish|"))
         break;
         expressions.add(expression);
         }
        
         */
        
        String[] expressions = new String[] {"oncontextmenu=\"showPopUp("};
        FilePrototype prototype = new FilePrototype(extensions, new LinkedList<>(Arrays.asList(expressions)));
        
        Finder finder = new Finder(prototype);
        Files.walkFileTree(Paths.get(path), finder);
        finder.done();
    }

}
