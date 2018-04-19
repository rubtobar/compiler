package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelCount;
import compilador.ThreeAddrCode.Operand;

public class NodeExpr extends Node {

    public NodeExpr expr;
    public NodeLogExpr logExpr;
    public Integer tid;
    private final String op;

    public NodeExpr(NodeExpr expr, NodeLogExpr logExpr, Integer tid, String operand, Object result) {
        super(result);
        this.expr = expr;
        this.logExpr = logExpr;
        this.tid = tid;
        this.op = operand;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen) {
        Operand log_op;
        int e1, e2;
        if (expr != null) {
            expr.generateCode(vt, pt, lt, gen);
        }
        logExpr.generateCode(vt, pt, lt, gen);
        if (expr != null) {
            if ("&".equals(op)) {
                log_op = Operand.AND;
            } else {
                log_op = Operand.OR;
            }
            gen.add(log_op, "v"+expr.tid, "v"+logExpr.tid, "v"+tid);
        }
    }

}
