package compilador.Nodes;

public class NodeContHead extends Node {

    NodeContHead contHead;

    public NodeContHead(NodeContHead contHead, Object result) {
        super(result);
        this.contHead = contHead;
    }

    public void generateCode() {
        if (contHead != null) {
            contHead.generateCode();
        }
    }
}
