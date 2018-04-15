package compilador.Nodes;

//sin declaracion de la varia
public class NodeAssignation extends Node {

    private final NodeExpr expr;

    public NodeAssignation(NodeExpr expr, Object result) {
        super(result);
        this.expr = expr;
    }

    public void generateCode() {
        if (expr != null) {
            expr.generateCode();
        }
    }

}
