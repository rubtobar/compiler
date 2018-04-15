package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;

public class NodeLogExpr extends Node {

    public NodeLogExpr logExpr;
    public NodeArExpr arExpr;

    public NodeLogExpr(NodeLogExpr logExpr, NodeArExpr arExpr, Object result) {
        super(result);
        this.logExpr = logExpr;
        this.arExpr = arExpr;
    }

    public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen) {
        if (logExpr != null) {
            logExpr.generateCode(vt,pt,gen);
        }
        arExpr.generateCode(vt,pt,gen);
    }

}
