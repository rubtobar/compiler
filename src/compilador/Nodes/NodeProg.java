package compilador.Nodes;

import compilador.*;

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
        
        public void generateCode(VarTable vt, ProcTable pt, ThreeAddrCode gen){
            if (decls != null)  decls.generateCode(vt,pt,gen);
            if (methods != null) methods.generateCode(vt,pt,gen);
            if (sentences != null) sentences.generateCode(vt,pt,gen);
        }
    }