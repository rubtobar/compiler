/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import static compilador.Compilador.PROC_TABLE_PRINTER_FILEPATH;
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
        
        public String name;
        public String label;
        int depth;
        int paramSize;
        int localSize;
        int returnSize;

        public Proc(String name, String label, int depth, int paramSize, int localSize, int returnSize) {
            this.name = name;
            this.label = label;
            this.depth = depth;
            this.paramSize = paramSize;
            this.localSize = localSize;
            this.returnSize = returnSize;
        }
        
        @Override
        public String toString(){     
            return name + "\t\t" +label + "\t\t" + depth + "\t\t" + paramSize + "\t\t" + localSize + "\t\t" + returnSize;
        }
    }

    public HashMap<Integer, Proc> procTable;

    public ProcTable() {
        procTable = new HashMap<>();
    }

    public void add(int id, String name, String label, int prof, int nparam, int localSize, int returnSize) {
        procTable.put(id, new Proc(name, label, prof, nparam, localSize, returnSize));
    }
    
    public void updateProcSize(int proc, int size) {
        procTable.get(proc).localSize = size;
    }
    
        @Override
    public String toString(){
        String str[] = new String[procTable.size()];
        String str1 = "ID\t\tNAME\t\tLABEL\t\tPROF\t\tP.SIZE\t\tL.SIZE\t\tR.SIZE\n"
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
            writer = new PrintWriter(PROC_TABLE_PRINTER_FILEPATH);
            writer.print(this.toString());
            writer.close();
        } catch (FileNotFoundException ex) {
            System.err.println("FALLO DE IMPRESIÓN");
        }
    }
}
