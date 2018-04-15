package compilador.Nodes;

import compilador.SyntaxTree;
import compilador.ThreeAddrCode.Operand;

public class NodeArExpr extends Node {

    private final NodeArExpr arExpr;
    private final NodeValue value;
    private final String op;

    public NodeArExpr(NodeArExpr arExpr, NodeValue value, String op, Object result) {
        super(result);
        this.arExpr = arExpr;
        this.value = value;
        this.op = op;
    }

    public void generateCode() {
        if (arExpr != null) {
            arExpr.generateCode();
        }
        value.generateCode();
        //int id = SyntaxTree.vt.addVar();
        //this.result = id;
        SyntaxTree.codeGen.add(Operand.OR, (Integer) arExpr.result, (Integer) value.result, 0);
    }
}
