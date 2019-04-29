/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package textreplacer.rules;

import java.util.regex.Pattern;

/**
 *
 * @author cbaez
 */
public class ReplaceText extends Rule{
    protected String target;
    protected Pattern replace;
    
    public ReplaceText(String target, Pattern pattern){
        this.target = target;
        this.replace = pattern;
    }
    
    public Object process(Object target){
        return ((String) target).repla
        return ((String) target).replace(this.target, replace);
    }
}
