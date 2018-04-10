package compilador.Nodes;

    public class NodeDecls extends Node{
        public NodeDecls decls;
        public Node decl;

        public NodeDecls(NodeDecls decls, Node decl, Object result) {
            super(result);
            this.decls = decls;
            this.decl = decl;
        }
        
        public void generateCode(){
            if (decls != null)  decls.generateCode();
            if (decl != null){
                if (decl instanceof NodeDecl) {
                    ((NodeDecl)decl).generateCode();
                } else if (decl instanceof NodeConstDecl) {
                    ((NodeConstDecl)decl).generateCode();
                }
            }
        }
        
    }