package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;

    public class NodeDecl extends Node {
        
        private final NodeAssign assign;
        public final int vid;
        
        public NodeDecl(NodeAssign assign, int vid, Object result) {
            super(result);
            this.assign = assign;
            this.vid = vid;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen){
            if (assign != null) {
                assign.generateCode(vt,pt,gen);
            }
        }
    }