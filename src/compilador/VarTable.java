/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.HashMap;

/**
 *
 * @author Ruben
 */
public class VarTable {

    private class Balde {

        String procName;
        int size;
        int offset;
        String name;

        public Balde(String proc, int size, int offset, String name) {
            this.procName = proc;
            this.size = size;
            this.offset = offset;
            this.name = name;
            
        }
        
        @Override
        public String toString(){
            return procName + "\t\t\t" + size + "\t\t\t" + offset + "\t\t\t" + name;
        }

    }

    HashMap<Integer, Balde> varTable;

    public VarTable() {
        this.varTable = new HashMap<>();
    }

    public void addVar(int id, String proc, int size, int offset, String name) {
        varTable.put(id, new Balde(proc, size, offset, name));
    }
    
    @Override
    public String toString(){
        String str = "ID\t\t\tPROC\t\t\tSIZE\t\t\tOFFSET\t\t\tVALUE\n";
        str = str + "-----------------------------------------------------------------------------------------------------\n";
        for (int id : this.varTable.keySet()) {
            str = str + id + "\t\t\t" + varTable.get(id) + "\n";
        }
        return str;
    }
    
    public void printOnFile() {
        PrintWriter writer;
        try {
            writer = new PrintWriter("fitxersES/TABLAVARIABLES.txt");
            writer.print(this.toString());
            writer.close();
        } catch (FileNotFoundException ex) {
            System.err.println("FALLO DE IMPRESIÓN");
        }

    }

}