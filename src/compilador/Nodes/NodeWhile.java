package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;
import compilador.LabelCount;

public class NodeWhile extends Node {

    NodeExpr expr;
    NodeSentences sentences;

    public NodeWhile(NodeExpr expr, NodeSentences sentences, Object result) {
        super(result);
        this.expr = expr;
        this.sentences = sentences;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen) {
        expr.generateCode(vt,pt,lt,gen);
        String eti = lt.add();
        String etf = lt.add();
        gen.add(Operand.SKIP, null, null, eti);
        gen.add(Operand.BEQ, "v"+expr.tid, "FALSE", etf);
        if (sentences != null) {
            sentences.generateCode(vt,pt,lt,gen);
        }
        gen.add(Operand.GOTO, null, null, eti);
        gen.add(Operand.SKIP, null, null, etf);
    }

}
