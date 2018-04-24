package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;
import compilador.LabelCount;

public class NodeArExpr extends Node {

    private final NodeArExpr arExpr;
    private final NodeValue value;
    private final String op;
    public Integer tid;

    public NodeArExpr(NodeArExpr arExpr, NodeValue value, String op, Integer tid, Object result) {
        super(result);
        this.arExpr = arExpr;
        this.value = value;
        this.op = op;
        this.tid = tid;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen) {
        if (arExpr != null) {
            arExpr.generateCode(vt, pt, lt, gen);
        }
        value.generateCode(vt, pt, lt, gen);
        if (arExpr == null) {
            this.tid = value.id;
        }
        if (op != null) {
            Operand operand;
            if (op.equals("+")) {
                operand = Operand.ADD;
            } else {
                operand = Operand.SUB;
            }
            gen.add(operand, "v" + arExpr.tid, "v" + value.id, "v" + tid);
        }
    }
}
