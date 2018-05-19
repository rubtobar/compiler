/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import static compilador.Compilador.SYMBOL_TABLE_PRINTER_FILEPATH;
import compilador.SymbolTable.Description.DescriptionType;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author jaumeferrergomila
 */
public class SymbolTable {

    private int currentLevel;
    private final ArrayList<Integer> scopeTable;
    private final ArrayList<TblSymbol> expansionTable;
    private final HashMap<String, TblSymbol> descriptionTable;
    private VarTable vt;
    private ProcTable pt;
    private int tempVarCounter;
    int currentProcId;

    public SymbolTable(VarTable vt, ProcTable pt) {
        this.expansionTable = new ArrayList<>();
        this.descriptionTable = new HashMap<>();
        scopeTable = new ArrayList<>();
        scopeTable.add(0);
        scopeTable.add(0);
        expansionTable.add(null);
        currentLevel = 1;
        this.vt = vt;
        this.pt = pt;
        currentProcId = 0;  //las variables con proc=0 pertenecen al main 
        this.tempVarCounter = 0;
    }

    public void reset() {
        descriptionTable.clear();
        scopeTable.clear();
        scopeTable.add(0);
        scopeTable.add(0);
        expansionTable.clear();
        expansionTable.add(null);
        currentLevel = 1;
    }

    public void enterBlock() {
        scopeTable.add(scopeTable.get(currentLevel));
        currentLevel++;
    }

    public void exitBlock() throws IllegalBlockExitException {
        if (currentLevel == 1) {
            throw new IllegalBlockExitException();
        }
        String id;
        int v_ini = scopeTable.remove(currentLevel);
        currentLevel--;
        int v_fi = scopeTable.get(currentLevel);
        for (int i = v_ini; i > v_fi; i--) {
            if (expansionTable.get(i).level != -1) {
                id = expansionTable.get(i).lexema;
                descriptionTable.get(id).d = expansionTable.get(i).d;
                descriptionTable.get(id).level = expansionTable.get(i).level;
            }
        }
        expansionTable.subList(v_fi + 1, v_ini + 1).clear();
        Set<String> keys = descriptionTable.keySet();
        Set<String> keys_to_remove = new TreeSet<>();
        for (String key : keys) {
            if (descriptionTable.get(key).level > currentLevel) {
                keys_to_remove.add(key);
            }
        }
        for (String key : keys_to_remove) {
            descriptionTable.remove(key);
        }

        /*al salir de un bloque quiere decir que salimos de la funcion
        que hemos declarado, por tanto reiniciamos el current proc ID*/
        currentProcId = 0;
    }

    public TblSymbol get(String id) {
        return descriptionTable.get(id);
    }

    public int add(String id, Description d, boolean reserved, boolean isParam)
            throws AlreadyDeclaredException, ReservedSymbolException {

        /*
        *   Fin de la parte del generador de codigo de 3 variables
         */
        TblSymbol antic = descriptionTable.get(id);
        if (antic != null) {
            if (antic.level == currentLevel) {
                throw new AlreadyDeclaredException();
            } else if (antic.level == 0) {
                throw new ReservedSymbolException();
            }
            scopeTable.set(currentLevel, scopeTable.get(currentLevel) + 1);
            expansionTable.add(new TblSymbol(antic.lexema, antic.d, antic.level));
        }
        if (reserved) {
            descriptionTable.put(id, new TblSymbol(id, d, 0));
        } else {
            descriptionTable.put(id, new TblSymbol(id, d));
        }
        /*
         *   Antes de comprovar si ya exixte lo introducimos en la tabla de variables
         *   En caso de que ya exista el propio analizador se ocupara de lanzar los errores
         *   Mientras tanto actuamos como si todo fuera correcto y almacenamos los simbolos como
         *   si fueran simbolos distintos y nuevos
         */
        int size = 0;
        switch (d.tsb) {
            case BOOL:
                //se debe declarar el tipo "boolean" antes que cualquier var booleana
                size = ((TypeDescription) descriptionTable.get("boolean").d).size;
                break;
            case INT:
                //se debe declarar el tipo "int" antes que cualquier var int
                size = ((TypeDescription) descriptionTable.get("int").d).size;
                break;
            case STRING:
                if (d.dt == DescriptionType.DVAR || id.equals("read")) {
                    size = ((TypeDescription) descriptionTable.get("string").d).size;
                }

                break;
        }

        switch (d.dt) {
            case DVAR:
                // id,programa,size,offset,value
                int procSize = vt.addVar(descriptionTable.get(id).id, currentProcId, size, id, isParam);
                pt.updateProcSize(currentProcId, procSize);
                break;
//            case DCONST:
//                // id,programa,size,offset,value
//                vt.addVar(descriptionTable.get(id).id, currentProcId, size, id);
//                break;
            case DPROC:
                // añadimos proc a la tabla de procs
                // modificamos los valores de las variables que 
                // hemos encontrado al encontrar el prog al que pertenecen
                String wrid = "";
                if ("write".equals(id)) {
                    wrid = "WRITE";
                } else if ("read".equals(id)) {
                    wrid = "READ";
                }
                // String name, String label, int prof, int nparam, int localSize
                pt.add(descriptionTable.get(id).id, id, wrid, 0, 0, size);
                /*En caso de que sean funciones reservadas no cambiamos el
                corrent proc durante las declaraciones*/
                if (!"write".equals(id) && !"read".equals(id)) {
                    currentProcId = descriptionTable.get(id).id;
                }
                break;
        }

        //retornamos el ID de la nueva var para recuperarla en
        //la tabla de var durante la generacion de codigo
        return descriptionTable.get(id).id;
    }

    public int addTemp(Description.TSB tsb) {
        int size = 0;
        int id = IdCount.count++;
        switch (tsb) {
            case BOOL:
                //se debe declarar el tipo "boolean" antes que cualquier var booleana
                size = ((TypeDescription) descriptionTable.get("boolean").d).size;
                break;
            case INT:
                //se debe declarar el tipo "int" antes que cualquier var int
                size = ((TypeDescription) descriptionTable.get("int").d).size;
                break;
            case STRING:
                size = ((TypeDescription) descriptionTable.get("string").d).size;
                break;
        }
        int procSize = vt.addVar(id, currentProcId, size, "t" + tempVarCounter++, false);
        pt.updateProcSize(currentProcId, procSize);
        return id;
    }

    public void addParameter(String idproc, String idparam, ArgDescription d)
            throws NoProcGivenException, AlreadyDeclaredException, ReservedSymbolException {
        TblSymbol aux = descriptionTable.get(idparam);
        if (aux != null && aux.level == 0) {
            throw new ReservedSymbolException();
        }
        Description daux = descriptionTable.get(idproc).d;
        if (daux.dt != DescriptionType.DPROC) {
            throw new NoProcGivenException();
        }
        ArgDescription darg = null;
        int idx_p = 0;
        int idx_e = ((ProcDescription) daux).firstArg;
        while (idx_e != 0 && !expansionTable.get(idx_e).lexema.equals(idparam)) {
            idx_p = idx_e;
            darg = (ArgDescription) expansionTable.get(idx_e).d;
            idx_e = darg.next;
        }
        if (idx_e != 0) {
            throw new AlreadyDeclaredException();
        }
        idx_e = scopeTable.get(currentLevel) + 1;
        scopeTable.set(currentLevel, idx_e);
        expansionTable.add(new TblSymbol(idparam, d, -1));
        if (idx_p == 0) {
            ((ProcDescription) daux).firstArg = idx_e;
        } else {
            darg.next = idx_e;
        }

        /*Por cada parametro perteneciente a un proceso, aumentamos la cantidad de
        parametros del proceso en la tabla de procs, para la generación de codigo*/
        int id = descriptionTable.get(idproc).id;
        ProcTable.Proc p = pt.procTable.get(id);
        p.paramSize += d.tsb == Description.TSB.BOOL ? 2 : d.tsb == Description.TSB.INT ? 4 : 32 ;
        pt.procTable.replace(id, p);
    }

    public TblSymbol getParameter(int idx) {
        return expansionTable.get(idx);
    }

    public static class Description {

        protected DescriptionType dt;
        public TSB tsb;

        protected enum TSB {
            INT, BOOL, STRING, VOID, NULL
        }

        protected enum DescriptionType {
            DVAR, DCONST, DPROC, DTYPE, DARG, NULL
        }

        public Description() {
            this.dt = DescriptionType.NULL;
            this.tsb = null;
        }

        @Override
        public String toString() {
            return dt.toString() + "\t\t\t" + tsb.toString();
        }
    }

    public static class TypeDescription extends Description {

        public int size, lowerL, upperL;

        public TypeDescription(Description.TSB tsb, int size, int lowerL, int upperL) {
            this.dt = DescriptionType.DTYPE;
            this.tsb = tsb;
            this.size = size;
            this.lowerL = lowerL;
            this.upperL = upperL;
        }
    }

    public static class ProcDescription extends Description {

        public int firstArg;

        public ProcDescription(Description.TSB tsb) {
            this.dt = DescriptionType.DPROC;
            this.tsb = tsb;
            firstArg = 0;
        }
    }

    public static class ArgDescription extends Description {

        public int next;
        public String idProc;

        public ArgDescription(String idProc, Description.TSB tsb) {
            this.dt = DescriptionType.DARG;
            this.idProc = idProc;
            this.tsb = tsb;
            next = 0;
        }
    }

    public static class VarDescription extends Description {

        public VarDescription(Description.TSB tsb) {
            this.dt = DescriptionType.DVAR;
            this.tsb = tsb;
        }
    }

    public static class ConstDescription extends Description {

        public String constValue;

        public ConstDescription(Description.TSB tsb, String constValue) {
            this.dt = DescriptionType.DCONST;
            this.tsb = tsb;
            this.constValue = constValue;
        }
    }

    public class TblSymbol {

        public int id;
        public int level;
        public String lexema;   //Crear con estructura de datos de string infinito
        public Description d;

        public TblSymbol(String lex, Description d) {
            this.lexema = lex;
            this.d = d;
            this.level = currentLevel;
            this.id = IdCount.count++;
        }

        public TblSymbol(String lex, Description d, int level) {
            this.lexema = lex;
            this.d = d;
            this.level = level;
            this.id = IdCount.count++;
        }

        @Override
        public String toString() {
            String s = lexema;
            s = s.concat("\t\t\t" + level);
            s = s.concat("\t\t\t" + d.toString());
            return s;
        }
    }

    public static class IllegalBlockExitException extends Exception {

        public IllegalBlockExitException() {
        }
    }

    public static class AlreadyDeclaredException extends Exception {

        public AlreadyDeclaredException() {
        }
    }

    public static class ReservedSymbolException extends Exception {

        public ReservedSymbolException() {
        }
    }

    public static class NoProcGivenException extends Exception {

        public NoProcGivenException() {
        }
    }

    @Override
    public String toString() {
        String string = "";
        string = string.concat("+-----------------------------------------------------------------SYMBOL TABLE------------------------------------------------------------------+"
                + "--------------------------------EXPANSION TABLE--------------------------------+"
                + "--SCOPE TABLE--+\n");
        string = string.concat("|\t\t\tPOSICION\t\tLEX\t\t\tNIVEL\t\t\tDESCR.TYPE\t\tTSB\t\t\t|"
                + "ID\t\t\tNIVEL\t\t\tDESCR.TYPE\t\tTSB\t|"
                + "***************|\n");
        string = string.concat("|***********************************************************************************************************************************************|"
                + "*******************************************************************************|"
                + "***************|\n");
        int i = 0;
        for (String name : this.descriptionTable.keySet()) {
            /*Tabla de simbolos*/
            string = string.concat("|\t\t\t");
            string = string.concat(i + "\t\t\t");
            string = string.concat(this.descriptionTable.get(name).toString());
            string = string.concat("\t\t\t|");
            /*Tabla de expansion*/
            if (i < this.expansionTable.size()) {
                try {
                    string = string.concat(expansionTable.get(i).toString() + "\t");
                } catch (NullPointerException e) {
                    string = string.concat("null\t\t\t\t\t\t\t\t\t\t");
                }
            } else {
                string = string.concat("\t\t\t\t\t\t\t\t\t\t");
            }
            string = string.concat("|");
            /*Tabla de Scope*/
            if (i < this.scopeTable.size()) {
                string = string.concat("\t" + scopeTable.get(i) + "\t");
            } else {
                string = string.concat("\t\t");
            }
            string = string.concat("|\n");

            i++;
        }
        string = string.concat("+-----------------------------------------------------------------------------------------------------------------------------------------------+"
                + "-------------------------------------------------------------------------------+"
                + "---------------+\n");
        return string;
    }

    public void print() {
        System.out.print(this.toString());
    }

    public void printOnFile() {
        PrintWriter writer;
        try {
            writer = new PrintWriter(SYMBOL_TABLE_PRINTER_FILEPATH);
            writer.print(this.toString());
            writer.print("Current Level: " + this.currentLevel);
            writer.close();
        } catch (FileNotFoundException ex) {
            System.err.println("FALLO DE IMPRESIÓN");
        }

    }

}
