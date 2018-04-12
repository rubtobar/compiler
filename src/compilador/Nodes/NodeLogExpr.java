package compilador.Nodes;

public class NodeLogExpr extends Node {

    NodeLogExpr logExpr;
    NodeArExpr arExpr;

    public NodeLogExpr(NodeLogExpr logExpr, NodeArExpr arExpr, Object result) {
        super(result);
        this.logExpr = logExpr;
        this.arExpr = arExpr;
    }

    public void generateCode() {
        if (logExpr != null) {
            logExpr.generateCode();
        }
        arExpr.generateCode();
    }

}
