package compilador.Nodes;

    public class NodeDecl extends Node{
        NodeAssign assign;
        String varname;

        public NodeDecl(NodeAssign assign, String varname ,Object result) {
            super(result);
            this.assign = assign;
        }
        
        public void generateCode(){
            if (assign != null) assign.generateCode();
        }
    }