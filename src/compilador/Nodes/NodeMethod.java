package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;

    public class NodeMethod extends Node{

        NodeHead head;
        NodeSentences sentences;
        NodeExpr returnExpr;

        public NodeMethod(NodeHead head, NodeSentences sentences, Object result) {
            super(result);
            this.head = head;
            this.sentences = sentences;
            this.returnExpr = null;
        }
        
        public NodeMethod(NodeHead head, NodeSentences sentences, NodeExpr returnExpr, Object result) {
            super(result);
            this.head = head;
            this.sentences = sentences;
            this.returnExpr = returnExpr;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen){
            head.generateCode(vt,pt,gen);
            // generar etiqueta e
            //pt.get(np).primeraEtiqueta = e;
            //gen.add(Operand.SKIP, 0, 0, e);
            if (sentences != null)  sentences.generateCode(vt,pt,gen);
            if (returnExpr != null)  returnExpr.generateCode(vt,pt,gen);
            //gen.add(Operand.RETURN, 0, 0, np);
        }
    }