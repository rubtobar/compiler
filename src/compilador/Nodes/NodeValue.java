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
    public String value;

    public NodeValue(NodeExpr expr, NodeCall call,
            Integer id, String value, Object result) {
        super(result);
        this.expr = expr;
        this.call = call;
        this.id = id;
        this.value = value;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen) {
        if (expr != null) {
            // Expressió
            id = expr.tid;
        } else if (call != null) {
            // Call
            call.generateCode(vt, pt, lt, gen);
            
        } else if (value != null) {
            // Literal
            gen.add(Operand.ASSIG, value, null, "v"+id);
        }
        // else Variable (id ja està assignat)
    }

}
