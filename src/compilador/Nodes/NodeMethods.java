package compilador.Nodes;

public class NodeMethods extends Node {

    NodeMethod method;
    NodeMethods methods;

    public NodeMethods(NodeMethod method, NodeMethods methods, Object result) {
        super(result);
        this.method = method;
        this.methods = methods;
    }

    public void generateCode() {
        if (method != null) {
            method.generateCode();
        }
        if (methods != null) {
            methods.generateCode();
        }

    }

}
