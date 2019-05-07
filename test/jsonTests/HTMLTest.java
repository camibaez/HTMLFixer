/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonTests;

import core.file.Cleaner;
import core.file.ConditionalPattern;
import core.file.FilePrototype;
import core.rules.ReplaceText;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import core.file.Profile;
import main.ProjectAdministration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author cbaez
 */
public abstract class HTMLTest {
    public String getTestBase(){
        return "conf\\test-files\\";
    }
    
    
    public String getTestPath(){
        return getTestBase() + this.getClass().getSimpleName() + "\\";
    }
}
