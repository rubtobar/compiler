package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;
import compilador.LabelTable;

public class NodeWhile extends Node {

    NodeExpr expr;
    NodeSentences sentences;

    public NodeWhile(NodeExpr expr, NodeSentences sentences, Object result) {
        super(result);
        this.expr = expr;
        this.sentences = sentences;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen) {
        expr.generateCode(vt,pt,lt,gen);
        int etf = lt.add();
        int eti = lt.add();
        gen.add(Operand.SKIP, null, null, "l"+eti);
        gen.add(Operand.BEQ, "v"+expr.tid, "0", "l"+etf);
        if (sentences != null) {
            sentences.generateCode(vt,pt,lt,gen);
        }
        gen.add(Operand.GOTO, null, null, "l"+eti);
        gen.add(Operand.SKIP, null, null, "l"+etf);
    }

}
