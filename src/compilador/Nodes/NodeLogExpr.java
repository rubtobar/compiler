package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operator;
import compilador.VarTable;
import compilador.LabelCount;

public class NodeLogExpr extends Node {

    public NodeLogExpr logExpr;
    public NodeArExpr arExpr;
    private final String op;
    public Integer tid;

    public NodeLogExpr(NodeLogExpr logExpr, NodeArExpr arExpr, Integer tid, String op, Object result) {
        super(result);
        this.logExpr = logExpr;
        this.arExpr = arExpr;
        this.op = op;
        this.tid = tid;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen) {
        Operator comparator = null;
        String e1, e2;
        arExpr.generateCode(vt, pt, lt, gen);
        if (logExpr != null) {
            logExpr.generateCode(vt, pt, lt, gen);
            switch (op) {
                case ">":
                    comparator = Operator.BGT;
                    break;
                case "<":
                    comparator = Operator.BLT;
                    break;
                case ">=":
                    comparator = Operator.BGE;
                    break;
                case "<=":
                    comparator = Operator.BLE;
                    break;
                case "==":
                    comparator = Operator.BEQ;
                    break;
                case "!=":
                    comparator = Operator.BNE;
                    break;
            }
            e1 = lt.add();
            gen.add(comparator, "v" + logExpr.tid, "v" + arExpr.tid, e1);
            gen.add(Operator.ASSIG, "FALSE", null, "v" + tid);
            e2 = lt.add();
            gen.add(Operator.GOTO, null, null, e2);
            gen.add(Operator.SKIP, null, null, e1);
            gen.add(Operator.ASSIG, "TRUE", null, "v" + tid);
            gen.add(Operator.SKIP, null, null, e2);
        } else {
            tid = arExpr.tid;
        }
    }
}
