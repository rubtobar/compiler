/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;

/**
 *
 * @author Ruben
 */
public class ProcTable {

    public class Proc {
        
        String name;
        int label;
        int depth;
        int nparam;
        int localSize;

        public Proc(String name, int label, int depth, int nparam, int localSize) {
            this.name = name;
            this.label = label;
            this.depth = depth;
            this.nparam = nparam;
            this.localSize = localSize;
        }
        
        @Override
        public String toString(){     
            return name + "\t\t" +label + "\t\t" + depth + "\t\t" + nparam + "\t\t" + localSize;
        }
    }

    HashMap<Integer, Proc> procTable;

    public ProcTable() {
        procTable = new HashMap<>();
    }

    public void add(int id, String name, int label, int prof, int nparam, int localSize) {
        procTable.put(id, new Proc(name, label, prof, nparam, localSize));
    }
    
        @Override
    public String toString(){
        String str[] = new String[procTable.size()];
        String str1 = "ID\t\tNAME\t\tLABEL\t\tPROF\t\tNPARAM\t\tL.SIZE\n"
        + "-----------------------------------------------------------------------------------------------------------------------------------------------------\n";

        int i = 0;
        for (int id : this.procTable.keySet()) {
            str[i] = String.format("%03d", id) + "\t\t" + procTable.get(id) + "\n";
            i++;
        }
        Arrays.sort(str);
        String row = "";
        for (String string : str) {
            row = row + string;
        }
        return str1 + row;
    }
    
    public void printOnFile() {
        PrintWriter writer;
        try {
            writer = new PrintWriter("fitxersES/TABLAPROCS.txt");
            writer.print(this.toString());
            writer.close();
        } catch (FileNotFoundException ex) {
            System.err.println("FALLO DE IMPRESIÓN");
        }
    }
}
