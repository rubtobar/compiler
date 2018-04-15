package compilador.Nodes;

import compilador.ProcTable;
import compilador.SyntaxTree;
import compilador.ThreeAddrCode;
import compilador.ThreeAddrCode.Operand;
import compilador.VarTable;

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

    public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen) {
        if (arExpr != null) {
            arExpr.generateCode(vt,pt,gen);
        }
        value.generateCode(vt,pt,gen);
        //int id = SyntaxTree.vt.addVar();
        //this.result = id;
        //SyntaxTree.codeGen.add(Operand.OR, (Integer) arExpr.result, (Integer) value.result, 0);
    }
}
