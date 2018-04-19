package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelTable;

    public class NodeConstDecl extends Node{
        
        private final NodeExpr expr;
        
        public NodeConstDecl(NodeExpr expr, Object result) {
            super(result);
            this.expr = expr;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen){
            // a continuacion se genera el valor o expr a asignar en la variable
            expr.generateCode(vt,pt,lt,gen);
        }
    }