package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;

    public class NodeConstDecl extends Node{
        
        private final NodeExpr expr;

        public NodeConstDecl(NodeExpr expr, Object result) {
            super(result);
            this.expr = expr;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen){
            // generamos la asignacion a la variable
            // a continuacion se genera el valor o expr a asignar en la variable
            expr.generateCode(vt,pt,gen);
        }
    }