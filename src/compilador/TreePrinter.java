/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ruben
 *
 */
public class TreePrinter {

    private PrintWriter writer;
    private HashMap<String, Integer> ocurrences;
    private int nivel;

    private class Production {

        public String parent;
        public String child;
        public int ocurrencesP;
        public int ocurrencesC;
        public int nivel;

        public Production(String parent, String child, int ocurrencesP, int ocurrencesC, int nivel) {
            this.parent = parent;
            this.child = child;
            this.ocurrencesP = ocurrencesP;
            this.ocurrencesC = ocurrencesC;
            this.nivel = nivel;
        }

    }

    public TreePrinter(String file) {
        nivel = 0;
        ocurrences = new HashMap<>();

        /*inicializamos el escritor para el .dot*/
        try {
            writer = new PrintWriter(file);
            writer.write("digraph DERIVATION_TREE {");
        } catch (FileNotFoundException ex) {
            Logger.getLogger(ErrorPrinter.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addDerivation(String parent, String[] childs) {

        if (childs == null) {
            if (!ocurrences.containsKey(parent)) {
                ocurrences.put(parent, 0);
            } else {
                ocurrences.replace(parent, ocurrences.get(parent) + 1);
            }
            return;
        }
        //String production = parent + " -> " + child + ";";
        for (String child : childs) {
            if (!ocurrences.containsKey(child)) {
                ocurrences.put(child, 0);
            }
        }

        if (!ocurrences.containsKey(parent)) {
            ocurrences.put(parent, 0);
        } else {
            ocurrences.replace(parent, ocurrences.get(parent) + 1);
        }

        int childlev;
        int x = 1;
        for (String child : childs) {
            childlev = ocurrences.get(child);
            if (child.equals(parent)) {
                childlev-=x;
            }
            writer.println(parent + ocurrences.get(parent) + " -> " + child + childlev);
            if (child.startsWith("tk_")) {
                ocurrences.replace(child, childlev + 1);
            }
        }
    }

    public void close() {
        /*finalizamos el archivo con el cierre de la clausula del grafo*/
        writer.print("\n}");
        writer.close();
    }

    public void bajarNivel() {
        nivel++;
    }
}
