/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package textreplacer;

import java.util.Arrays;
import java.util.List;

/**
 *
 * @author cbaez
 */
public class FilePrototype {
    protected String extensions;
    //rc;expr
    protected List<String> expressions; 

    public FilePrototype(String extensions, List<String> expressions) {
        this.extensions = extensions;
        this.expressions = expressions;
    }

    public String getExtensions() {
        return extensions;
    }

    public void setExtensions(String extensions) {
        this.extensions = extensions;
    }

    public List<String> getExpressions() {
        return expressions;
    }

    public void setExpressions(List<String> expressions) {
        this.expressions = expressions;
    }
    
    

    
    
    
}
