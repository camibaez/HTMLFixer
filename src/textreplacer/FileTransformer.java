/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package textreplacer;

import java.io.File;
import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author cbaez
 */
public class FileTransformer {
    protected Document document;
    
    public FileTransformer(File f) throws IOException{
        document = Jsoup.parse(f, null);
    }
    
    public String getHeader(){
        return document.select("head").toString();
    }
    
    public void arrangeCssOrder(){
        Elements links = document.select("head>link[rel=\"stylesheet\"]");
        for (Element link : links) {
            String href = link.attr("href");
            
        }
    }
}
