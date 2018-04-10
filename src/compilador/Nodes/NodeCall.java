package compilador.Nodes;

    public class NodeCall extends Node{
        NodeContCall contCall;

        public NodeCall(NodeContCall contCall, Object result) {
            super(result);
            this.contCall = contCall;
        }
        
        public void generateCode(){
            if (contCall != null) contCall.generateCode();
        }
        
    }