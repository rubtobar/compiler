package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelTable;
import compilador.ThreeAddrCode.Operand;

public class NodeExpr extends Node {

    public NodeExpr expr;
    public NodeLogExpr logExpr;
    public Integer tid;
    private String op;

    public NodeExpr(NodeExpr expr, NodeLogExpr logExpr, Integer tid, String operand, Object result) {
        super(result);
        this.expr = expr;
        this.logExpr = logExpr;
        this.tid = tid;

    }

    public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen) {
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
            e1 = lt.add();
            gen.add(log_op, "v" + logExpr.tid, "v" + logExpr.tid, "l" + e1);
            gen.add(Operand.ASSIG, "0", null, "v" + tid);
            e2 = lt.add();
            gen.add(Operand.GOTO, null, null, "l" + e2);
            gen.add(Operand.SKIP, null, null, "l" + e1);
            gen.add(Operand.ASSIG, "1", null, "v" + tid);
            gen.add(Operand.SKIP, null, null, "l" + e2);
        }
    }

}
