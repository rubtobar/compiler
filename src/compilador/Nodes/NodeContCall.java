package compilador.Nodes;

    public class NodeContCall extends Node{
        NodeExpr expr;
        NodeContCall contCall;

        public NodeContCall(NodeExpr expr, NodeContCall contCall, Object result) {
            super(result);
            this.expr = expr;
            this.contCall = contCall;
        }
        
        public void generateCode(){
            expr.generateCode();
            if (contCall != null) contCall.generateCode();
        }
        
    }