package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;

public class NodeMethods extends Node {

    NodeMethod method;
    NodeMethods methods;

    public NodeMethods(NodeMethod method, NodeMethods methods, Object result) {
        super(result);
        this.method = method;
        this.methods = methods;
    }

    public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen) {
        if (method != null) {
            method.generateCode(vt,pt,gen);
        }
        if (methods != null) {
            methods.generateCode(vt,pt,gen);
        }

    }

}
