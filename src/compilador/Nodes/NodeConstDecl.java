package compilador.Nodes;

    public class NodeConstDecl extends Node{
        NodeExpr expr;

        public NodeConstDecl(NodeExpr expr, Object result) {
            super(result);
            this.expr = expr;
        }
        
        public void generateCode(){
            // generamos la asignacion a la variable
            // a continuacion se genera el valor o expr a asignar en la variable
            expr.generateCode();
        }
    }