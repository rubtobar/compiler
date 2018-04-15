package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;

    public class NodeContCall extends Node{
        
        private final NodeExpr expr;
        private final NodeContCall contCall;

        public NodeContCall(NodeExpr expr, NodeContCall contCall, Object result) {
            super(result);
            this.expr = expr;
            this.contCall = contCall;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen){
            expr.generateCode(vt,pt,gen);
            if (contCall != null) contCall.generateCode(vt,pt,gen);
        }
        
    }