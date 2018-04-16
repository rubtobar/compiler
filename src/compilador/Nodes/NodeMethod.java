package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;
import compilador.LabelTable;

    public class NodeMethod extends Node{

        NodeHead head;
        NodeSentences sentences;
        NodeExpr returnExpr;
        Integer np;

        public NodeMethod(NodeHead head, NodeSentences sentences, Integer np, Object result) {
            super(result);
            this.head = head;
            this.sentences = sentences;
            this.returnExpr = null;
            this.np = np;
        }
        
        public NodeMethod(NodeHead head, NodeSentences sentences, NodeExpr returnExpr, Integer np, Object result) {
            super(result);
            this.head = head;
            this.sentences = sentences;
            this.returnExpr = returnExpr;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen){
            head.generateCode(vt,pt,gen);
            int e = lt.add();
            pt.procTable.get(np).label = e;
            gen.add(Operand.SKIP, null, null, e);
            if (sentences != null)  sentences.generateCode(vt,pt,lt,gen);
            if (returnExpr != null)  returnExpr.generateCode(vt,pt,lt,gen);
            gen.add(Operand.RETURN, null, null, np);
        }
    }