package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;

    public class NodeIf extends Node{
        NodeExpr expr;
        NodeSentences sentences;

        public NodeIf(NodeExpr expr, NodeSentences sentences, Object result) {
            super(result);
            this.expr = expr;
            this.sentences = sentences;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen){
            expr.generateCode(vt,pt,gen);
            if (sentences != null) sentences.generateCode(vt,pt,gen);
        }
        
    }