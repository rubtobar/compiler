package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
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
            //generar etiqueta e
            //gen.add(Operand.BEQ, expr.tid, 1, e);
            if (sentences != null) sentences.generateCode(vt,pt,gen);
            //gen.add(Operand.SKIP, 0, 0, e);
        }
        
    }