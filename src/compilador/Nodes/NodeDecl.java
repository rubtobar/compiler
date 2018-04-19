package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelTable;
import compilador.ThreeAddrCode.Operand;

public class NodeDecl extends Node {

    private final NodeAssign assign;
    public final int vid;

    public NodeDecl(NodeAssign assign, int vid, Object result) {
        super(result);
        this.assign = assign;
        this.vid = vid;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen) {
        if (assign.expr != null) {
            assign.generateCode(vt, pt, lt, gen);
            gen.add(Operand.ASSIG, "v" + assign.expr.tid, null, "v" + vid);
        }
    }
}
