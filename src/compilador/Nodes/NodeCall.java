package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelTable;

    public class NodeCall extends Node{
        
        private final NodeContCall contCall;

        public NodeCall(NodeContCall contCall, Object result) {
            super(result);
            this.contCall = contCall;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen){
            if (contCall != null) contCall.generateCode(vt,pt,lt,gen);
            /*for(param : contCall.params){
                gen.add(Operand.PARAM, 0, 0, param);
            }*/
            //gen.add(Operand.CALL, 0, 0, np);
        }
        
    }