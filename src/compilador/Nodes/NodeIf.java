package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;
import compilador.LabelCount;

    public class NodeIf extends Node{
        NodeExpr expr;
        NodeSentences sentences;

        public NodeIf(NodeExpr expr, NodeSentences sentences, Object result) {
            super(result);
            this.expr = expr;
            this.sentences = sentences;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen){
            expr.generateCode(vt,pt,lt,gen);
            String e = lt.add();
            gen.add(Operand.BEQ, "v"+expr.tid, "FALSE", e);
            if (sentences != null) sentences.generateCode(vt,pt,lt,gen);
            gen.add(Operand.SKIP, null, null, e);
        }
        
    }