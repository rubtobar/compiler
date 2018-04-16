package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelTable;

    public class NodeDecls extends Node{
        public NodeDecls decls;
        public Node decl;

        public NodeDecls(NodeDecls decls, Node decl, Object result) {
            super(result);
            this.decls = decls;
            this.decl = decl;
        }
        
        public void generateCode(VarTable vt, ProcTable pt, LabelTable lt, ThreeAddrCode gen){
            if (decls != null)  decls.generateCode(vt,pt,lt,gen);
            if (decl != null){
                if (decl instanceof NodeDecl) {
                    ((NodeDecl)decl).generateCode(vt,pt,lt,gen);
                } else if (decl instanceof NodeConstDecl) {
                    ((NodeConstDecl)decl).generateCode(vt,pt,lt,gen);
                }
            }
        }
        
    }