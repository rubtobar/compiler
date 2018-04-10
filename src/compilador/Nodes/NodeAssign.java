package compilador.Nodes;

    //declarando la variable al mismo tie


    public class NodeAssign extends Node{
        public NodeExpr expr;

        public NodeAssign(NodeExpr expr, Object result) {
            super(result);
            this.expr = expr;
        }
        
        public void generateCode(){
            if (expr != null) expr.generateCode();
        }
        
    }