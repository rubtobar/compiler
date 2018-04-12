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

    public class Balde {

        int proc;
        int size;
        int offset;
        String name;

        public Balde(int proc, int size, int offset, String name) {
            this.proc = proc;
            this.size = size;
            this.offset = offset;
            this.name = name;
        }

        @Override
        public String toString() {
            return proc + "\t\t" + size + "\t\t" + offset + "\t\t" + name;
        }

    }

    HashMap<Integer, Balde> varTable;

    /*Tabla con los offsets de cada variable, al entrar
    una variable nueva, el valor aumentara para cada programa
    -Los offsets seran siempre positivos, se cambiara el signo en 
    funcion de si son var de retorno, argumentos o variables*/
    HashMap<Integer, Integer> offsets;

    public VarTable() {
        this.varTable = new HashMap<>();
        this.offsets = new HashMap<>();
    }

    public void addVar(int id, int proc, int size, String name) {
        int offset = offsets.getOrDefault(proc, -1);
        if (offset == -1) {
            //el offset para este programa no esta creado
            offsets.put(proc, size);
            offset = size;
        } else {
            /*el offset ya existe, lo aumentamos para dejar cabida a la
            nueva variable*/
            offset = offset + size;
            offsets.replace(proc, offset);
        }
        varTable.put(id, new Balde(proc, offset, offset, name));
    }

    @Override
    public String toString() {
        String str = "ID\t\tPROC\t\tSIZE\t\tOFFSET\t\tVALUE\n";
        str = str + "-----------------------------------------------------------------------------------------------------\n";
        for (int id : this.varTable.keySet()) {
            str = str + id + "\t\t" + varTable.get(id) + "\n";
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
