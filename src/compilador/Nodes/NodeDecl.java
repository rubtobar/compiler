package compilador.Nodes;

    public class NodeDecl extends Node {
        
        private final NodeAssign assign;
        public final int vid;
        
        public NodeDecl(NodeAssign assign, int vid, Object result) {
            super(result);
            this.assign = assign;
            this.vid = vid;
        }
        
        public void generateCode(){
            if (assign != null) {
                assign.generateCode();
            }
        }
    }