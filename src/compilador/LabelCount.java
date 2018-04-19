/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

/**
 *
 * @author JaumeFerrerGomila
 */
public class LabelCount {

    private int count;

    public LabelCount() {
        count = 0;
    }

    public String add() {
        int id = count++;
        return "L" + id;
    }
}
