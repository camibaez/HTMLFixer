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
public class ReplaceText extends TextRule {

    protected Pattern pattern;
    protected String replace;

    protected int flags;

    public ReplaceText(String pattern, String replace) {
        this.pattern = Pattern.compile(pattern);
        this.replace = replace;

    }

    public ReplaceText(String pattern, String replace, int flags) {
        this.pattern = Pattern.compile(pattern, flags);
        this.replace = replace;
        this.flags = flags;
    }

    @Override
    public Object transform(String target) {
        return pattern.matcher(target).replaceAll(replace);
    }

    public String getPattern() {
        return pattern.pattern();
    }

    public String getReplace() {
        return replace;
    }

    public int getFlags() {
        return flags;
    }

}
