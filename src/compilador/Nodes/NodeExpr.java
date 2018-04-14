package compilador.Nodes;

    public class NodeExpr extends Node{
        public NodeExpr expr;
        public NodeLogExpr logExpr;

        public NodeExpr(NodeExpr expr, NodeLogExpr logExpr, Object result) {
            super(result);
            this.expr = expr;
            this.logExpr = logExpr;
        }
        
        public void generateCode(){
            if (expr != null) expr.generateCode();
            logExpr.generateCode();
        }
        
    }