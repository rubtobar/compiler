package compilador.Nodes;

public class NodeHead extends Node {

    NodeContHead contHead;

    public NodeHead(NodeContHead contHead, Object result) {
        super(result);
        this.contHead = contHead;
    }

    public void generateCode() {
        if (contHead != null) {
            contHead.generateCode();
        }
    }

}
