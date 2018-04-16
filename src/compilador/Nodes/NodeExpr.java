package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelTable;

    public class NodeExpr extends Node{
        public NodeExpr expr;
        public NodeLogExpr logExpr;
        public Integer tid;
        
        public NodeExpr(NodeExpr expr, NodeLogExpr logExpr, Integer tid, Object result) {
            super(result);
            this.expr = expr;
            this.logExpr = logExpr;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen){
            if (expr != null) expr.generateCode(vt,pt,lt,gen);
            logExpr.generateCode(vt,pt,lt,gen);
        }
        
    }