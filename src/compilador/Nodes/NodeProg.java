package compilador.Nodes;

    public class NodeProg extends Node{
        public NodeDecls decls;
        public NodeMethods methods;
        public NodeSentences sentences;

        public NodeProg(NodeDecls decls, NodeMethods methods, NodeSentences sentences, Object result) {
            super(result);
            this.decls = decls;
            this.methods = methods;
            this.sentences = sentences;
        }
        
        public void generateCode(){
            if (decls != null)  decls.generateCode();
            if (methods != null) methods.generateCode();
            if (sentences != null) sentences.generateCode();
        }
    }