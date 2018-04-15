package compilador.Nodes;

    //declarando la variable al mismo 
import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;



    public class NodeAssign extends Node{
        
        private final NodeExpr expr;

        public NodeAssign(NodeExpr expr, Object result) {
            super(result);
            this.expr = expr;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen){
            if (expr != null) expr.generateCode(vt,pt,gen);
        }
        
    }