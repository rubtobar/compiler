package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;

    public class NodeExpr extends Node{
        public NodeExpr expr;
        public NodeLogExpr logExpr;
        public Integer tid;
        
        public NodeExpr(NodeExpr expr, NodeLogExpr logExpr, Integer tid, Object result) {
            super(result);
            this.expr = expr;
            this.logExpr = logExpr;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen){
            if (expr != null) expr.generateCode(vt,pt,gen);
            logExpr.generateCode(vt,pt,gen);
        }
        
    }