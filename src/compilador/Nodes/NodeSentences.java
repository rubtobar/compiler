package compilador.Nodes;

import compilador.ProcTable;
import compilador.ThreeAddrCode;
import compilador.VarTable;
import compilador.LabelCount;

public class NodeSentences extends Node {

    Node sentence;
    NodeSentences sentences;

    public NodeSentences(Node sentence, NodeSentences sentences, Object result) {
        super(result);
        this.sentence = sentence;
        this.sentences = sentences;
    }

    public void generateCode(VarTable vt, ProcTable pt, LabelCount lt, ThreeAddrCode gen) {
        if (sentence != null) {
            if (sentence instanceof NodeDecl) {
                ((NodeDecl) sentence).generateCode(vt,pt,lt,gen);
            } else if (sentence instanceof NodeConstDecl) {
                ((NodeConstDecl) sentence).generateCode(vt,pt,lt,gen);
            } else if (sentence instanceof NodeCall) {
                ((NodeCall) sentence).generateCode(vt,pt,lt,gen);
            } else if (sentence instanceof NodeAssignation) {
                ((NodeAssignation) sentence).generateCode(vt,pt,lt,gen);
            } else if (sentence instanceof NodeIf) {
                ((NodeIf) sentence).generateCode(vt,pt,lt,gen);
            } else if (sentence instanceof NodeWhile)  {
                ((NodeWhile) sentence).generateCode(vt,pt,lt,gen);
            }
        }
        if (sentences != null) {
            sentences.generateCode(vt,pt,lt,gen);
        }
    }

}
