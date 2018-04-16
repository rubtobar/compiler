package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;

public class NodeArExpr extends Node {

    private final NodeArExpr arExpr;
    private final NodeValue value;
    private final String op;
    public final Integer tid;

    public NodeArExpr(NodeArExpr arExpr, NodeValue value, String op, Integer tid, Object result) {
        super(result);
        this.arExpr = arExpr;
        this.value = value;
        this.op = op;
        this.tid = tid;
    }

    public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen) {
        if (arExpr != null) {
            arExpr.generateCode(vt, pt, gen);
        }
        value.generateCode(vt, pt, gen);
        if (op != null) {
            Operand operand;
            if (op.equals("+")) {
                operand = Operand.ADD;
            } else {
                operand = Operand.SUB;
            }
            gen.add(operand, "v"+arExpr.tid, "v"+value.id, tid);
        }
    }
}
