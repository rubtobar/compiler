/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import static compilador.Compilador.ASSEMBLY_PRINTER_FILEPATH;
import static compilador.Compilador.THREE_ADDR_PRINTER_FILEPATH;
import compilador.Nodes.NodeProg;
import java.util.ArrayList;

/**
 *
 * @author Ruben
 */
public class SyntaxTree {

    private NodeProg root;
    private final VarTable vt;
    private final ProcTable pt;
    private final LabelCount lt;
    private final ThreeAddrCode code;

    public SyntaxTree() {
        vt = new VarTable();
        pt = new ProcTable();
        lt = new LabelCount();
        code = new ThreeAddrCode(vt, pt);
        root = null;
    }

    public void setRoot(NodeProg root) {
        this.root = root;
    }

    public VarTable getVt() {
        return vt;
    }

    public ProcTable getPt() {
        return pt;
    }

    void generateCode() {
        root.generateCode(vt, pt, lt, code);
        code.flush(THREE_ADDR_PRINTER_FILEPATH);
        code.write68Kcode(ASSEMBLY_PRINTER_FILEPATH);
        //code.optimize();
        //code.flush(THREE_ADDR_PRINTER_FILEPATH.replace(".txt", "_OPT.txt"));
        // code.write68Kcode(ASSEMBLY_PRINTER_FILEPATH.replace(".X68", "_OPT.X68"));
    }
    
    public static class ProcData {
        public String name;
        public SymbolTable.Description.TSB returnType;
        public ArrayList<Param> params;

        public ProcData(String name, SymbolTable.Description.TSB returnType, ArrayList<Param> params) {
            this.name = name;
            this.returnType = returnType;
            this.params = params;
        }
    }
    public static class Param {
        public String name;
        public SymbolTable.Description.TSB type;

        public Param(String name, SymbolTable.Description.TSB type) {
            this.name = name;
            this.type = type;
        }
    }
}
