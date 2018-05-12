/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import static compilador.Compilador.VAR_TABLE_PRINTER_FILEPATH;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;

/**
 *
 * @author Ruben
 */
public class VarTable {
    
    //Tamaño de el estado de la maquina a guardar en la pila
    final int SAVED_STATE_SIZE = 64;

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

    /*Tabla con los varOffsets de cada variable, al entrar
    una variable nueva, el valor aumentara para cada programa
    -Los varOffsets seran siempre positivos, se cambiara el signo en 
    funcion de si son var de retorno, argumentos o variables*/
    HashMap<Integer, Integer> varOffsets;
    HashMap<Integer, Integer> paramOffsets;

    public VarTable() {
        this.varTable = new HashMap<>();
        this.varOffsets = new HashMap<>();
        this.paramOffsets = new HashMap<>();
    }

    public int addVar(int id, int proc, int size, String name, boolean isParam) {

        HashMap<Integer, Integer> map;

        if (!isParam) {
            map = varOffsets;
            // Sumamos el offset del estado de la maquina guardado
            size = -size;
        } else {
            map = paramOffsets;
        }

        Integer offset = map.getOrDefault(proc, null);
        if (offset == null) {
            //el offset para este programa no esta creado
            if (isParam) {
                // Le añadimos el espacio para guardar los registros
                map.put(proc, 0+SAVED_STATE_SIZE);
                offset = 0+SAVED_STATE_SIZE;
            } else {
                
                map.put(proc, size);
                offset = size;
            }
        } else {
            /*el offset ya existe, lo aumentamos para dejar cabida a la
        nueva variable*/
            offset = offset + size;
            map.replace(proc, offset);
        }
        varTable.put(id, new Balde(proc, Math.abs(size), offset, name));
        return Math.abs(varOffsets.getOrDefault(proc, 0));
    }

    @Override
    public String toString() {
        String str[] = new String[varTable.size()];
        String str1 = "ID\t\tPROC\t\tSIZE\t\tOFFSET\t\tVARNAME\n"
                + "----------------------------------------------------------------------\n";
        //kuytckyuytc
        int i = 0;
        for (int id : this.varTable.keySet()) {
            str[i] = String.format("%03d", id) + "\t\t" + varTable.get(id) + "\n";
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
            writer = new PrintWriter(VAR_TABLE_PRINTER_FILEPATH);
            writer.print(this.toString());
            writer.close();
        } catch (FileNotFoundException ex) {
            System.err.println("FALLO DE IMPRESIÓN");
        }
    }

}
