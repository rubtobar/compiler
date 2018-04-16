package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;
import compilador.LabelTable;

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

    public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen) {
        Operand comparator = null;
        int e1, e2;
        if (logExpr != null) {
            logExpr.generateCode(vt, pt, lt, gen);
            switch (op) {
                case ">":
                    comparator = Operand.BGT;
                    break;
                case "<":
                    comparator = Operand.BLT;
                    break;
                case ">=":
                    comparator = Operand.BGE;
                    break;
                case "<=":
                    comparator = Operand.BLE;
                    break;
            }
        }
        arExpr.generateCode(vt, pt, gen);
        e1 = lt.add();
        gen.add(comparator, "v"+logExpr.tid, "v"+arExpr.tid, e1);
        gen.add(Operand.ASSIG, "0", null, tid);
        e2 = lt.add();
        gen.add(Operand.GOTO, null, null, e2);
        gen.add(Operand.SKIP, null, null, e1);
        gen.add(Operand.ASSIG, "1", null, tid);
        gen.add(Operand.SKIP, null, null, e2);
    }
}
