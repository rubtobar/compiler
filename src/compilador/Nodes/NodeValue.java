package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelTable;
import compilador.ThreeAddrCode.Operand;

public class NodeValue extends Node {

    public NodeExpr expr;
    public NodeCall call;
    public Integer id;
    public Object value;

    public NodeValue(NodeExpr expr, NodeCall call,
            Integer id, Object value, Object result) {
        super(result);
        this.expr = expr;
        this.call = call;
        this.id = id;
        this.value = value;
    }

    public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen) {
        if (expr != null) {
            
        } else if (call != null) {

        } else if (value != null) {
            //gen.add(Operand.ASSIG, id, 0, 0);
        } else {
            
        }
    }

}
