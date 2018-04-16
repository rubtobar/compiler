package compilador.Nodes;

//sin declaracion de la varia

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelTable;

public class NodeAssignation extends Node {

    private final NodeExpr expr;

    public NodeAssignation(NodeExpr expr, Object result) {
        super(result);
        this.expr = expr;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen) {
        if (expr != null) {
            expr.generateCode(vt,pt,lt,gen);
        }
    }

}
