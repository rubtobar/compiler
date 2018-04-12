package compilador.Nodes;

    public class NodeExpr extends Node{
        NodeExpr expr;
        NodeLogExpr logExpr;

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