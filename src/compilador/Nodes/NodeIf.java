package compilador.Nodes;

    public class NodeIf extends Node{
        NodeExpr expr;
        NodeSentences sentences;

        public NodeIf(NodeExpr expr, NodeSentences sentences, Object result) {
            super(result);
            this.expr = expr;
            this.sentences = sentences;
        }
        
        public void generateCode(){
            expr.generateCode();
            if (sentences != null) sentences.generateCode();
        }
        
    }