/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import compilador.VarTable.Balde;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeSet;

/**
 *
 * @author Ruben
 */
public class ThreeAddrCode {

    private final ArrayList<ThreeAddrIstr> code;
    private final ArrayList<BasicBlock> bbTable;
    private final HashMap<Integer, Integer> labelTable;

    private static final int BB_I = 0;
    private static final int BB_O = 1;

    private final VarTable vt;
    private final ProcTable pt;

    public enum Operand {
        ADD, SUB, AND, OR, SKIP, GOTO, BLT, BLE, BGE, BGT, BNE, BEQ, CALL, FUN, RETURN, PARAM, ASSIG
    }

    private class ThreeAddrIstr {

        private final Operand op;
        private String src1;
        private String src2;
        private final String dest;

        public ThreeAddrIstr(Operand op, String src1, String src2, String dest) {
            this.op = op;
            this.src1 = src1;
            this.src2 = src2;
            this.dest = dest;
        }

        public boolean isCondBra() {
            int ord = op.ordinal();
            return ord >= Operand.BLT.ordinal() && ord <= Operand.BEQ.ordinal();
        }

        private boolean isCommutative() {
            switch (this.op) {
                case ADD:
                case SUB:
                case BEQ:
                case BNE:
                case AND:
                case OR:
                    return true;
                default:
                    return false;
            }
        }

        @Override
        public String toString() {

            String sdest = getPrintable(dest), ssrc1 = getPrintable(src1), ssrc2 = getPrintable(src2);

            switch (op) {
                case ADD:
                    return sdest + " = " + ssrc1 + " + " + ssrc2;
                case SUB:
                    return sdest + " = " + ssrc1 + " - " + ssrc2;
                case AND:
                    return sdest + " = " + ssrc1 + " & " + ssrc2;
                case OR:
                    return sdest + " = " + ssrc1 + " | " + ssrc2;
                case SKIP:
                    return sdest + ": skip";
                case GOTO:
                    return "goto: " + sdest;
                case BLT:
                    return "if " + ssrc1 + " < " + ssrc2 + " goto " + sdest;
                case BLE:
                    return "if " + ssrc1 + " <= " + ssrc2 + " goto " + sdest;
                case BGE:
                    return "if " + ssrc1 + " >= " + ssrc2 + " goto " + sdest;
                case BGT:
                    return "if " + ssrc1 + " > " + ssrc2 + " goto " + sdest;
                case BNE:
                    return "if " + ssrc1 + " != " + ssrc2 + " goto " + sdest;
                case BEQ:
                    return "if " + ssrc1 + " = " + ssrc2 + " goto " + sdest;
                case CALL:
                    return "call " + sdest;
                case FUN:
                    return sdest + " = fun " + ssrc1;
                case RETURN:
                    return "return " + sdest;
                case PARAM:
                    return "param " + sdest;
                case ASSIG:
                    return sdest + " = " + ssrc1;
            }
            return "--:INSTRUCTIONERROR:--";
        }

        /* Donat un argument d'una instrucció, obté un String amb el format per imprimir */
        private String getPrintable(String arg) {
            String s = null;
            if (arg != null) {
                if (arg.startsWith("v")) {
                    s = vt.varTable.get(Integer.parseInt(arg.substring(1))).name;
                } else if (arg.startsWith("p")) {
                    s = pt.procTable.get(Integer.parseInt(arg.substring(1))).label;
                } else if (arg.startsWith("'")) {
                    s = "\"" + arg.substring(1) + "\"";
                } else {
                    s = new String(arg);
                }
            }
            return s;
        }

        public String get68KCode() {
            Balde varDestino;
            Balde varSrc1;
            Balde varSrc2;
            String instr = "\t;" + this.toString() + "\n";
            switch (op) {
                case ADD:
                    varDestino = vt.varTable.get(Integer.parseInt(dest.substring(1)));
                    varSrc1 = vt.varTable.get(Integer.parseInt(src1.substring(1)));
                    varSrc2 = vt.varTable.get(Integer.parseInt(src2.substring(1)));
                    // Sumamos los valores en D0
                    instr += "\tmove.l " + varSrc1.offset + "(A6), D0\n"; // enviamos a D0
                    instr += "\tadd.l " + varSrc2.offset + "(A6), D0\n"; // sumamos en D0
                    instr += "\tmove.l D0," + varDestino.offset + "(A6)\n"; // enviamos a dest
                    break;
                case SUB:
                    varDestino = vt.varTable.get(Integer.parseInt(dest.substring(1)));
                    varSrc1 = vt.varTable.get(Integer.parseInt(src1.substring(1)));
                    varSrc2 = vt.varTable.get(Integer.parseInt(src2.substring(1)));
                    // Sumamos los valores en D0
                    instr += "\tmove.l " + varSrc1.offset + "(A6), D0\n"; // enviamos a D0
                    instr += "\tsub.l " + varSrc2.offset + "(A6), D0\n"; // sumamos en D0
                    instr += "\tmove.l D0," + varDestino.offset + "(A6)\n"; // enviamos a dest
                    break;
                case AND:
                    break;
                case OR:
                    break;
                case SKIP:
                    instr = instr.substring(1) + dest + ":";
                    break;
                case GOTO:
                    instr += "\tBRA " + dest;
                    break;
                case BLT:
                    break;
                case BLE:
                    break;
                case BGE:
                    break;
                case BGT:
                    break;
                case BNE:
                    break;
                case BEQ:
                    break;
                case CALL:
                    break;
                case FUN:
                    break;
                case RETURN:
                    break;
                case PARAM:
                    break;
                case ASSIG:
                    // Copiamos la variable a su lugar de destino
                    varDestino = vt.varTable.get(Integer.parseInt(dest.substring(1)));
                    Balde source1;
                    // Es un avariable
                    if (src1.startsWith("v")) {
                        source1 = vt.varTable.get(Integer.parseInt(src1.substring(1)));
                        
                        // En caso de estar pasando un String, lo copiamos
                        if(varDestino.size == 32){
                            for (int i = 0; i < 32; i++) {
                                instr += "\tmove.b " + (source1.offset + i) + "(A6), " + (varDestino.offset + i) + "(A6)\n";
                            }
                            break;
                        }
                        // Pasamos su indexado en la pila
                        src1 = source1.offset + "(A6)";
                        
                    } else if (src1.startsWith("\'")) {
                        // Quitamo la comilla del string
                        src1 = src1.replace("\'", "");
                    } else {
                        //Si no es una variable añadimos '#'
                        src1 = "#" + src1;
                    }
                    // Boolean
                    if (varDestino.size == 2) {
                        instr += "\tmove.w " + src1 + ", " + varDestino.offset + "(A6)\n";
                        break;
                        
                    } 
                    // Integer
                    if (varDestino.size == 4) {
                        instr += "\tmove.l " + src1 + ", " + varDestino.offset + "(A6)\n";
                        break;
                    }
                    // String
                    for (int i = 0; i < src1.toCharArray().length; i++) {
                        // Mover string trozo a trozo
                        instr += "\tmove.b #\'" + src1.toCharArray()[i] + "\', " + (varDestino.offset + i) + "(A6)\n";
                    }
                    instr += "\tmove.b #0, " + (varDestino.offset + src1.toCharArray().length) + "(A6)\n";
                    break;
                default:
                    return "bad instr: " + op.toString();
            }
            return instr;
        }

        /*private String getLoadInstr(String src, String reg) {
            String code;
            String val = src.substring(1);
            if (src.charAt(0) == 'v') {
                int varId = Integer.parseInt(val);
                int v_depth = pt.procTable.get(vt.varTable.get(varId).proc).depth;
                int v_offset = vt.varTable.get(varId).offset;
                //int p_depth = pt.procTable.get(*nivellActual*).depth;
                int v_4depth = v_depth * 4;
            } else {
                code = "MOVE.L #"+val+", "+reg;
            }
            return code;
        }*/
    }

    private class BasicBlock {

        private final int firstI;
        private int lastI;
        private final TreeSet<Integer> pred;
        private final TreeSet<Integer> succ;

        public BasicBlock(int firstI, int lastI) {
            pred = new TreeSet<>();
            succ = new TreeSet<>();
            this.firstI = firstI;
            this.lastI = lastI;
        }

        public void addPred(int newPred) {
            pred.add(newPred);
        }

        public void addSucc(int newSucc) {
            succ.add(newSucc);
        }
    }

    public ThreeAddrCode(VarTable vt, ProcTable pt) {
        code = new ArrayList<>();
        this.bbTable = new ArrayList<>();
        this.labelTable = new HashMap<>();
        this.vt = vt;
        this.pt = pt;
    }

    public void add(Operand op, String src1, String src2, String dest) {
        code.add(new ThreeAddrIstr(op, src1, src2, dest));
    }

    public void optimize() {
        // Commutative operator normalization
        String aux;
        ThreeAddrIstr instr;
        boolean interChange;
        for (int i = 0; i < code.size(); i++) {
            interChange = false;
            instr = code.get(i);
            if (instr.isCommutative()
                    && instr.src2.charAt(0) == 'v'
                    && (instr.src1.charAt(0) != 'v'
                    || instr.src2.compareTo(instr.src1) < 0)) {
                aux = instr.src1;
                instr.src1 = instr.src2;
                instr.src2 = aux;
            }
        }

        // BB initialization
        // Leader identification //
        bbTable.add(new BasicBlock(0, 0)); // I: 0, O: 1
        bbTable.add(new BasicBlock(0, 0));
        for (int i = 0; i < code.size(); i++) {
            instr = code.get(i);
            if (instr.op == Operand.SKIP) {
                labelTable.put(Integer.parseInt(instr.dest.substring(1)), bbTable.size());
                bbTable.add(new BasicBlock(i, 0));
            } else if (instr.isCondBra()) {
                ThreeAddrIstr nextInstr = code.get(i + 1);
                if (!nextInstr.isCondBra()) {
                    switch (nextInstr.op) {
                        case GOTO:
                        case RETURN:
                        case SKIP:
                            break;
                        default:
                            bbTable.add(new BasicBlock(i + 1, 0));
                            break;
                    }
                }
            }
        }
        // Relation identification //
        bbTable.get(BB_I).succ.add(2);
        if (bbTable.size() > 2) {
            bbTable.get(2).pred.add(BB_I);
        }
        for (int b = 2; b < bbTable.size(); b++) {
            int i = bbTable.get(b).firstI;
            instr = code.get(i);
            int label = Integer.parseInt(instr.dest.substring(1));
            while (instr.op != Operand.GOTO && !instr.isCondBra()
                    && instr.op != Operand.RETURN && (instr.op != Operand.SKIP
                    || b == labelTable.get(label)) && i < bbTable.size()) {
                instr = code.get(++i);
                label = Integer.parseInt(instr.dest.substring(1));
            }
            while (instr.isCondBra()) {
                int instrBB = labelTable.get(label);
                bbTable.get(instrBB).addPred(b);
                bbTable.get(b).addSucc(instrBB);
                instr = code.get(++i);
            }
            label = Integer.parseInt(instr.dest.substring(1));
            switch (instr.op) {
                case GOTO:
                    bbTable.get(b).lastI = i;
                    int instrBB = labelTable.get(label);
                    bbTable.get(instrBB).addPred(b);
                    bbTable.get(b).addSucc(instrBB);
                    break;
                case RETURN:
                    bbTable.get(b).lastI = i;
                    bbTable.get(BB_O).addPred(b);
                    bbTable.get(b).addSucc(BB_O);
                    break;
                default:
                    bbTable.get(b).lastI = i - 1;
                    int next;
                    if (b < bbTable.size() - 1) {
                        next = b + 1;
                    } else {
                        next = BB_O;
                    }
                    bbTable.get(next).addPred(b);
                    bbTable.get(b).addSucc(next);
            }
        }
    }

    public void write68Kcode(String filename) {
        PrintWriter writer;
        try {
            writer = new PrintWriter(filename);
            // Generamos etiqueta de ORG
            writer.print("\tORG\t$1000\n");
            // Generamos valores TRUE y FALSE
            writer.print("\tTRUE:\tEQU\t1\n");
            writer.print("\tFALSE:\tEQU\t0\n");
            // Generamos etiqueta START
            writer.print("START:\n");

            // Colocamos A6 para indexar el StackPointer
            writer.print("\t;A6 to index variables\n");
            writer.print("\tmove.l SP, A6\n");

            // Generamos variables globales 
            // Generamos variables del main
            Balde balde;
            for (Integer id : vt.varTable.keySet()) {
                balde = vt.varTable.get(id);
                // Pertenece al main(Proc = 0)
                if (balde.proc == 0) {
                    // Añadimos comentario
                    writer.print("\t;" + balde.name + " save space in Stack\n");
                    // Asignamos el espacio en la pila
                    writer.print("\tsub.l #" + balde.size + ", SP\n");
                }
            }

            // Generamos codigo de instrucciones
            code.forEach((_item) -> {
                writer.print(_item.get68KCode() + "\n");
            });

            // Generamos codigo de END
            writer.print("\tSIMHALT\n\n\n\n\tEND\tSTART");
            writer.close();
        } catch (FileNotFoundException ex) {
            System.err.println("FALLO DE ESCRITURA EN EL CODIGO DE ENSAMBLADOR");
        }
    }

    public void flush(String filename) {
        /*escribir en fichero*/
        PrintWriter writer;
        try {
            writer = new PrintWriter(filename);
            code.forEach((_item) -> {
                writer.print(_item.toString() + "\n");
            });
            writer.close();
        } catch (FileNotFoundException ex) {
            System.err.println("FALLO DE ESCRITURA EN EL CODIGO DE 3 DIRECCIONES");
        }
    }
}
