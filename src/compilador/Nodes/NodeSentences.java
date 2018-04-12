package compilador.Nodes;

public class NodeSentences extends Node {

    Node sentence;
    NodeSentences sentences;

    public NodeSentences(Node sentence, NodeSentences sentences, Object result) {
        super(result);
        this.sentence = sentence;
        this.sentences = sentences;
    }

    public void generateCode() {
        if (sentence != null) {
            if (sentence instanceof NodeDecl) {
                ((NodeDecl) sentence).generateCode();
            } else if (sentence instanceof NodeConstDecl) {
                ((NodeConstDecl) sentence).generateCode();
            } else if (sentence instanceof NodeCall) {
                ((NodeCall) sentence).generateCode();
            } else if (sentence instanceof NodeAssignation) {
                ((NodeAssignation) sentence).generateCode();
            } else if (sentence instanceof NodeIf) {
                ((NodeIf) sentence).generateCode();
            } else if (sentence instanceof NodeWhile)  {
                ((NodeWhile) sentence).generateCode();
            }
        }
        if (sentences != null) {
            sentences.generateCode();
        }
    }

}
