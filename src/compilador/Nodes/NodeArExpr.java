package compilador.Nodes;

public class NodeArExpr extends Node {

    NodeArExpr arExpr;
    NodeValue value;

    public NodeArExpr(NodeArExpr arExpr, NodeValue value, Object result) {
        super(result);
        this.arExpr = arExpr;
        this.value = value;
    }

    public void generateCode() {
        if (arExpr != null) {
            arExpr.generateCode();
        }
        value.generateCode();
    }

}
