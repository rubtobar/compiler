package compilador.Nodes;

    public class NodeMethod extends Node{

        NodeHead head;
        NodeSentences sentences;
        NodeExpr returnExpr;

        public NodeMethod(NodeHead head, NodeSentences sentences, Object result) {
            super(result);
            this.head = head;
            this.sentences = sentences;
            this.returnExpr = null;
        }
        
        public NodeMethod(NodeHead head, NodeSentences sentences, NodeExpr returnExpr, Object result) {
            super(result);
            this.head = head;
            this.sentences = sentences;
            this.returnExpr = returnExpr;
        }
        
        public void generateCode(){
            if (head != null)  head.generateCode();
            if (sentences != null)  sentences.generateCode();
            if (returnExpr != null)  returnExpr.generateCode();
        }
    }