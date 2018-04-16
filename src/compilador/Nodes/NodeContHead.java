package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelTable;

public class NodeContHead extends Node {

    private final NodeContHead contHead;

    public NodeContHead(NodeContHead contHead, Object result) {
        super(result);
        this.contHead = contHead;
    }

    public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen) {
        if (contHead != null) {
            contHead.generateCode(vt,pt,gen);
        }
    }
}
