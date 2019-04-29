/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package textreplacer.rules;

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
public abstract class HtmlRule  extends Rule{
    protected Document document;
    
    public HtmlRule(Document doc) throws IOException{
        this.document = doc;
    }
    
    public abstract boolean process();
    
}
