package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelCount;
import compilador.ThreeAddrCode.Operand;
import java.util.ArrayList;

public class NodeCall extends Node {

    private final NodeContCall contCall;
    public int procId;

    public NodeCall(NodeContCall contCall, int procId, Object result) {
        super(result);
        this.contCall = contCall;
        this.procId = procId;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen) {
        if (contCall != null) {
            ArrayList<Integer> params = contCall.generateCode(vt, pt, lt, gen);
            for (int param : params) {
                gen.add(Operand.PARAM, null, null, "v" + param);
            }
        }
        gen.add(Operand.CALL, null, null, "p" + procId);
    }

}
