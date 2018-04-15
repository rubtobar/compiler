package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;

public class NodeWhile extends Node {

    NodeExpr expr;
    NodeSentences sentences;

    public NodeWhile(NodeExpr expr, NodeSentences sentences, Object result) {
        super(result);
        this.expr = expr;
        this.sentences = sentences;
    }

    public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen) {
        expr.generateCode(vt,pt,gen);
        //genera et_f
        //genera et_i
        //gen.add(Operand.SKIP, 0, 0, et_i);
        //gen.add(Operand.BEQ, expr.tid, 0, et_f);
        if (sentences != null) {
            sentences.generateCode(vt,pt,gen);
        }
        //gen.add(Operand.GOTO, 0, 0, et_i);
        //gen.add(Operand.SKIP, 0, 0, et_f);
    }

}
