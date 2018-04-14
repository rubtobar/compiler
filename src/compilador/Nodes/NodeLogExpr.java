package compilador.Nodes;

public class NodeLogExpr extends Node {

    public NodeLogExpr logExpr;
    public NodeArExpr arExpr;

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
