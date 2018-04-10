package compilador.Nodes;

public class NodeWhile extends Node {

    NodeExpr expr;
    NodeSentences sentences;

    public NodeWhile(NodeExpr expr, NodeSentences sentences, Object result) {
        super(result);
        this.expr = expr;
        this.sentences = sentences;
    }

    public void generateCode() {
        expr.generateCode();
        if (sentences != null) {
            sentences.generateCode();
        }
    }

}
