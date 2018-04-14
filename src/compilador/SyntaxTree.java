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
    private final VarTable vt;
    private final ProcTable pt;
    
    public SyntaxTree() {
        this.vt = new VarTable();
        this.pt = new ProcTable();
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
