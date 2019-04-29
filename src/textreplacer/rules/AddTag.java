/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package textreplacer.rules;

import java.io.File;
import java.io.IOException;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author cbaez
 */
public class AddTag extends HtmlRule {

    public static final int BEGINING_TAG = 1,
            END_TAG = 2,
            BEFORE_TAG = 3,
            AFTER_TAG = 4;

    protected String tag;
    protected String targetQuery;
    protected int position;

    public AddTag(Document doc, String targetTagQuery, String tag, int position) throws IOException {
        super(doc);
        this.targetQuery = targetTagQuery;
        this.tag = tag;
    }

    @Override
    public boolean process() {
        Elements res = document.select(targetQuery);
        if (res.isEmpty()) {
            return false;
        }
        Element target = res.first();
        switch (position) {
            case BEGINING_TAG:
                target.prepend(tag);
                break;
            case END_TAG:
                target.prepend(tag);
                break;
            case BEFORE_TAG:
                target.before(tag);
            case AFTER_TAG:
                target.after(tag);
        }
        
        return true;
    }

}
