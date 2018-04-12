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
public class ProcTable {

    public class Proc {

        String name;
        String label;
        int depth;
        int nparam;
        int localSize;

        public Proc(String name, String label, int depth, int nparam, int localSize) {
            this.label = label;
            this.depth = depth;
            this.nparam = nparam;
            this.localSize = localSize;
            this.name = name;
        }
        
        @Override
        public String toString(){     
            return name + "\t\t\t" + label + "\t\t\t" + depth + "\t\t\t" + nparam + "\t\t\t" + localSize + "\t\t\t" + name;
        }
    }

    HashMap<Integer, Proc> procTable;

    public ProcTable() {
        procTable = new HashMap<>();
    }

    public void add(String name, String label, int prof, int nparam, int localSize) {
        procTable.put(IdCount.count++, new Proc(name, label, prof, nparam, localSize));
    }
    
        @Override
    public String toString(){
        String str = "ID\t\t\tNAME\t\t\tLABEL\t\t\tPROF\t\t\tNPARAM\t\t\tL.SIZE\t\t\tNAME\n";
        str = str + "-----------------------------------------------------------------------------------------------------------------------------------------------------\n";
        for (int id : this.procTable.keySet()) {
            str = str + id + "\t\t\t" + procTable.get(id) + "\n";
        }
        return str;
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
