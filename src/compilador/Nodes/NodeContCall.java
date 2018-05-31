package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelCount;
import java.util.ArrayList;

public class NodeContCall extends Node {

    public final String proc;
    private final NodeExpr expr;
    private final NodeContCall contCall;

    public NodeContCall(String proc, NodeExpr expr, NodeContCall contCall, Object result) {
        super(result);
        this.proc = proc;
        this.expr = expr;
        this.contCall = contCall;
    }

    public ArrayList generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen) {
        expr.generateCode(vt, pt, lt, gen);
        ArrayList<Integer> params;
        if (contCall != null) {
            params = contCall.generateCode(vt, pt, lt, gen);
        }else{
            params = new ArrayList();
        }
        params.add(expr.tid);
        return params;
    }

}
