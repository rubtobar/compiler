package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;
import compilador.LabelCount;

public class NodeMethod extends Node {

    NodeHead head;
    NodeSentences sentences;
    NodeExpr returnExpr;
    int np;

    public NodeMethod(NodeHead head, NodeSentences sentences, int np, Object result) {
        super(result);
        this.head = head;
        this.sentences = sentences;
        this.returnExpr = null;
        this.np = np;
    }

    public NodeMethod(NodeHead head, NodeSentences sentences, NodeExpr returnExpr, int np, Object result) {
        super(result);
        this.head = head;
        this.sentences = sentences;
        this.returnExpr = returnExpr;
        this.np = np;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen) {
        head.generateCode(vt, pt, gen);
        String e = lt.add();
        pt.procTable.get(np).label = e;
        gen.add(Operand.SKIP, null, null, e);
        // Generamos preambulo de funcion
        gen.add(Operand.PREFUNCT, null, null, ""+np);
        if (sentences != null) {
            sentences.generateCode(vt, pt, lt, gen);
        }
        if (returnExpr != null) {
            returnExpr.generateCode(vt, pt, lt, gen);
        }
        if (returnExpr != null) {
            gen.add(Operand.RETURN, ""+np, null, "v" + returnExpr.tid);
        } else {
            gen.add(Operand.RETURN, null, null, null);
        }
    }
}
