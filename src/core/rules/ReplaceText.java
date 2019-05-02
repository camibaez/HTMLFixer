/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.rules;

import java.util.regex.Pattern;

/**
 *
 * @author cbaez
 */
public class ReplaceText extends TextRule{

    protected String pattern;

    
    protected String replace;

    public ReplaceText(String pattern, String replace) {
        this.pattern = pattern;
        this.replace = replace;
    }

    @Override
    public Object transform(String target) {
        return target.replaceAll(pattern, replace);
    }

    
    
    public String getPattern() {
        return pattern;
    }

    
    public String getReplace() {
        return replace;
    }

   
}
