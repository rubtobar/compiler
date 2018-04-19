package compilador.Nodes;

//sin declaracion de la variable

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelCount;
import compilador.ThreeAddrCode.Operand;

public class NodeAssignation extends Node {

    private final NodeExpr expr;
    private final int id;
    
    public NodeAssignation(int id, NodeExpr expr, Object result) {
        super(result);
        this.id = id;
        this.expr = expr;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen) {
        if (expr != null) {
            expr.generateCode(vt,pt,lt,gen);
            gen.add(Operand.ASSIG, "v"+expr.tid, null, "v"+id);
        }
    }

}
