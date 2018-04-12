package compilador.Nodes;

public class NodeValue extends Node {

    NodeExpr expr;
    NodeCall call;
    Integer id;
    Object value;

    public NodeValue(NodeExpr expr, NodeCall call,
            Integer id, Object value, Object result) {
        super(result);
        this.expr = expr;
        this.call = call;
        this.id = id;
        this.value = value;
    }

    public void generateCode() {
    }

}
