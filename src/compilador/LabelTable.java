/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import java.util.ArrayList;

/**
 *
 * @author JaumeFerrerGomila
 */
public class LabelTable {
    
    private class Label {
        
        public Label() {
        }
    }
    
    private int count;
    ArrayList<Label> table;
    
    public LabelTable () {
        table = new ArrayList<>();
        count = 0;
    }
    
    public Integer add() {
        int id = count++;
        table.add(new Label());
        return id;
    }
}
