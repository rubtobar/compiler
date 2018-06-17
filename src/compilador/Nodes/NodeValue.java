package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelCount;
import compilador.ThreeAddrCode.Operator;

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

    public void generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen) {
        if (expr != null) {
            // Expressió
            expr.generateCode(vt, pt, lt, gen); //*
            id = expr.tid;
        } else if (call != null) {
            // Call
            call.generateCode(vt, pt, lt, gen);
            this.id = call.tid;
        } else if (value != null) {
            // Literal
            gen.add(Operator.ASSIG, value, null, "v"+id);
        }
        // else Variable (id ja està assignat)
    }

}
