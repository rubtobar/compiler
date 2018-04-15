/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import compilador.Nodes.NodeProg;

/**
 *
 * @author Ruben
 */
public class SyntaxTree {

    private NodeProg root;
    public static VarTable vt;
    public static ProcTable pt;
    public static ThreeAddrCode codeGen;
    
    public SyntaxTree() {
        vt = new VarTable();
        pt = new ProcTable();
        codeGen = new ThreeAddrCode();
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
        root.generateCode();
    }
}
