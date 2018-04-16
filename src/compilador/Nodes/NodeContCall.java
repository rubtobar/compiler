package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelTable;

    public class NodeContCall extends Node{
        
        private final NodeExpr expr;
        private final NodeContCall contCall;

        public NodeContCall(NodeExpr expr, NodeContCall contCall, Object result) {
            super(result);
            this.expr = expr;
            this.contCall = contCall;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen){
            expr.generateCode(vt,pt,lt,gen);
            if (contCall != null) contCall.generateCode(vt,pt,lt,gen);
        }
        
    }