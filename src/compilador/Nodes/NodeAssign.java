package compilador.Nodes;

    //declarando la variable al mismo 
import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelCount;


    public class NodeAssign extends Node{
        
        final NodeExpr expr;

        public NodeAssign(NodeExpr expr, Object result) {
            super(result);
            this.expr = expr;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen){
            if (expr != null) expr.generateCode(vt,pt,lt,gen);
        }
        
    }