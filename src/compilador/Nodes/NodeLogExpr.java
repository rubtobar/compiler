package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;

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

    public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen) {
        Operand operand = null;
        if (logExpr != null) {
            logExpr.generateCode(vt, pt, gen);
            switch (op) {
                case ">":
                    operand = Operand.BGT;
                    break;
                case "<":
                    operand = Operand.BLT;
                    break;
                case ">=":
                    operand = Operand.BGE;
                    break;
                case "<=":
                    operand = Operand.BLE;
                    break;
            }
        }
        arExpr.generateCode(vt, pt, gen);
        //genera etiqueta e1
        //gen.add(operand, logExpr.tid, arExpr.tid, e1);
        //gen.add(Operand.ASSIG, 0, 0, tid);
        //genera etiqueta e2
        //gen.add(Operand.GOTO, 0, 0, e2);
        //gen.add(Operand.SKIP, 0, 0, e1);
        //gen.add(Operand.ASSIG, 1, 0, tid);
        //gen.add(Operand.SKIP, 0, 0, e2);
    }
}
