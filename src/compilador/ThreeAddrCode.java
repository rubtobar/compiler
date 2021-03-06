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
import java.util.Map;
import java.util.TreeSet;

/**
 *
 * @author Ruben
 */
public class ThreeAddrCode {

    private final ArrayList<ThreeAddrIstr> code;
    private final ArrayList<BasicBlock> bbTable;
    private final HashMap<String, Integer> labelTable;

    private static final int BB_I = 0;
    private static final int BB_O = 1;

    private final VarTable vt;
    private final ProcTable pt;

    public enum Operand {
        ADD, SUB, AND, OR, SKIP, GOTO, BLT, BLE, BGE, BGT, BNE, BEQ, CALL, RETURN, PARAM, ASSIG, PREFUNCT, RETURN_SPACE
    }

    private class ThreeAddrIstr {

        private Operand op;
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
                    return (src1 == null ? "" : ssrc1 + " = ") + "call " + sdest;
                case RETURN:
                    return "return " + sdest;
                case PARAM:
                    return "param " + sdest;
                case ASSIG:
                    return sdest + " = " + ssrc1;
                case PREFUNCT:
                    return "preambulo funcion";
                case RETURN_SPACE:
                    return sdest + " return space";
            }
            return "--:INSTRUCTIONERROR:--";
        }

        /* Donat un argument d'una instrucci??, obt?? un String amb el format per imprimir */
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

        public String getLocation(String source) {
            Balde var;
            if (source.startsWith("v")) {
                var = vt.varTable.get(Integer.parseInt(source.substring(1)));
                if (var.proc == 0) {
                    // Global var/main
                    return var.offset + "(A5)";
                } else {
                    // Variable local
                    return var.offset + "(A6)";
                }
            } else {
                return "#" + source;
            }
        }

        public String get68KCode() {
            String instr = "\t;" + this.toString() + "\n";
            int size;
            switch (op) {
                case ADD:
                    // Sumamos los valores en D0
                    instr += "\tmove.l " + getLocation(src1) + ", D0\n"; // enviamos a D0
                    instr += "\tadd.l " + getLocation(src2) + ", D0\n"; // sumamos en D0
                    instr += "\tmove.l D0," + getLocation(dest) + "\n"; // enviamos a dest
                    break;
                case SUB:
                    // Restamos los valores en D0
                    instr += "\tmove.l " + getLocation(src1) + ", D0\n"; // enviamos a D0
                    instr += "\tsub.l " + getLocation(src2) + ", D0\n"; // sumamos en D0
                    instr += "\tmove.l D0," + getLocation(dest) + "\n"; // enviamos a dest
                    break;
                case AND:
                    // AND de los valores en D0
                    instr += "\tmove.w " + getLocation(src1) + ", D0\n"; // enviamos a D0
                    instr += "\tand.w " + getLocation(src2) + ", D0\n"; // sumamos en D0
                    instr += "\tmove.w D0," + getLocation(dest) + "\n"; // enviamos a dest
                    break;
                case OR:
                    // OF de los valores en D0
                    instr += "\tmove.w " + getLocation(src1) + ", D0\n"; // enviamos a D0
                    instr += "\tor.w " + getLocation(src2) + ", D0\n"; // sumamos en D0
                    instr += "\tmove.w D0," + getLocation(dest) + "\n"; // enviamos a dest
                    break;
                case SKIP:
                    instr = instr.substring(1) + dest + ":";
                    break;
                case GOTO:
                    instr += "\tBRA " + dest;
                    break;
                case BLT:
                    instr += "\tmove.l " + getLocation(src1) + ", D0\n"; // enviamos a D0
                    instr += "\tcmp.l " + getLocation(src2) + ", D0\n"; // enviamos a D0
                    instr += "\tblt.l " + dest + "\n"; // enviamos a D0
                    break;
                case BLE:
                    instr += "\tmove.l " + getLocation(src1) + ", D0\n"; // enviamos a D0
                    instr += "\tcmp.l " + getLocation(src2) + ", D0\n"; // enviamos a D0
                    instr += "\tble.l " + dest + "\n"; // enviamos a D0
                    break;
                case BGE:
                    instr += "\tmove.l " + getLocation(src1) + ", D0\n"; // enviamos a D0
                    instr += "\tcmp.l " + getLocation(src2) + ", D0\n"; // enviamos a D0
                    instr += "\tbge.l " + dest + "\n"; // enviamos a D0
                    break;
                case BGT:
                    instr += "\tmove.l " + getLocation(src1) + ", D0\n"; // enviamos a D0
                    instr += "\tcmp.l " + getLocation(src2) + ", D0\n"; // enviamos a D0
                    instr += "\tbgt.l " + dest + "\n"; // enviamos a D0
                    break;
                case BNE:
                    size = vt.varTable.get(Integer.parseInt(src1.substring(1))).size;
                    instr += "\tmove." + (size == 4 ? "l" : "w") + " " + getLocation(src1) + ", D0\n";
                    //instr += "\tmove.l " + getLocation(src1) + ", D0\n"; // enviamos a D0
                    instr += "\tcmp." + (size == 4 ? "l" : "w") + " " + getLocation(src2) + ", D0\n";
                    //instr += "\tcmp.l " + getLocation(src2) + ", D0\n"; // enviamos a D0
                    instr += "\tbne.l " + dest + "\n"; // enviamos a D0
                    break;
                case BEQ:
                    size = vt.varTable.get(Integer.parseInt(src1.substring(1))).size;
                    instr += "\tmove." + (size == 4 ? "l" : "w") + " " + getLocation(src1) + ", D0\n";
                    //instr += "\tmove.l " + getLocation(src1) + ", D0\n"; // enviamos a D0
                    instr += "\tcmp." + (size == 4 ? "l" : "w") + " " + getLocation(src2) + ", D0\n";
                    //instr += "\tcmp.l " + getLocation(src2) + ", D0\n"; // enviamos a D0
                    instr += "\tbeq.l " + dest + "\n"; // enviamos a D0
                    break;
                case CALL:
                    ProcTable.Proc prog = pt.procTable.get(Integer.parseInt(dest.substring(1)));
                    instr += "\tbsr.l " + prog.label + "\n"; // Saltamos a dest
                    instr += "\t;clean parameters\n";
                    instr += "\tadd.l #" + prog.paramSize + ", SP\n"; // limpiamos los parametros de la pila a la vuelta
                    //int returnTemporalVar = vt.varTable.get(Integer.parseInt(src1.substring(1))).offset;
                    //instr += "\tmove.l (SP)+, " + returnTemporalVar + "(A5)\n";
                    if (src1 != null) {
                        instr += "\t;fetch return\n";
                        String destLoc1 = getLocation(src1);
                        size = vt.varTable.get(Integer.parseInt(src1.substring(1))).size;
                        switch (size) {
                            case 2:
                                instr += "\tmove.w (SP)+, " + destLoc1 + "\n";
                                break;
                            case 4:
                                instr += "\tmove.l (SP)+, " + destLoc1 + "\n";
                                break;
                            case 32:
                                // Var String = Var String
                                int destinoOff = vt.varTable.get(Integer.parseInt(src1.substring(1))).offset;
                                String regDest = vt.varTable.get(Integer.parseInt(src1.substring(1))).proc == 0 ? "(A5)" : "(A6)";
                                for (int i = 0; i < 32; i += 4) {
                                    instr += "\tmove.l (SP)+, " + (destinoOff + i) + regDest + "\n";
                                }
                                break;
                        }
                    }
                    break;
                case RETURN:
                    if (src1 != null) {
                        // Para indexar el return
                        int returnOffset = pt.procTable.get(Integer.parseInt(src1)).paramSize;
                        returnOffset += vt.SAVED_STATE_SIZE; //Espacio de variables de retorno 
                        // Tama??o return
                        int returnSize = pt.procTable.get(Integer.parseInt(src1)).returnSize;
                        //--int returnedVarOffset = vt.varTable.get(Integer.parseInt(dest.substring(1))).offset;
                        instr += "\t;send return value\n";
                        String varToRet = getLocation(dest);
                        //instr += "\tmove.l " + returnedVarOffset + "(A6), " + returnOffset + "(A6)\n";
                        switch (returnSize) {
                            case 2:
                                instr += "\tmove.w " + varToRet + ", " + returnOffset + "(A6)\n";
                                break;
                            case 4:
                                instr += "\tmove.l " + varToRet + ", " + returnOffset + "(A6)\n";
                                break;
                            case 32:
                                // Var String = Var String
                                int srcOff = vt.varTable.get(Integer.parseInt(dest.substring(1))).offset;
                                String regSrc = vt.varTable.get(Integer.parseInt(dest.substring(1))).proc == 0 ? "(A5)" : "(A6)";
                                for (int i = 0; i < 32; i += 4) {
                                    instr += "\tmove.l " + (srcOff + i) + regSrc + ", " + (returnOffset + i) + "(A6)\n";
                                }
                                break;
                        }
                    }
                    instr += "\t;prepare SP\n";
                    instr += "\tmove.l A6, SP\n";
                    instr += "\t;restore BP\n";
                    instr += "\tmove.l (SP)+, A6\n";
                    instr += "\t;give control to caller\n";
                    instr += "\trts\n"; // Saltamos
                    break;
                case RETURN_SPACE:
                    int retSize = pt.procTable.get(Integer.parseInt(dest.substring(1))).returnSize;
                    instr += "\tsub.l #" + retSize + ", SP\n"; // reservamos el espacio en la pila para el return
                    break;
                case PARAM:
                    size = vt.varTable.get(Integer.parseInt(dest.substring(1))).size;
                    if (size == 32) {
                        int srcOff = vt.varTable.get(Integer.parseInt(dest.substring(1))).offset;
                        String regSrc = vt.varTable.get(Integer.parseInt(dest.substring(1))).proc == 0 ? "(A5)" : "(A6)";
                        instr += "\tsub.l #32, SP\n"; // Reservamos espacio en la pila
                        for (int i = 0; i < 32; i += 4) {
                            instr += "\tmove.l " + (srcOff + i) + regSrc + ", " + i + "(SP)\n";
                        }
                    } else {
                        instr += "\tmove." + (size == 4 ? "l" : "w") + " " + getLocation(dest) + ", -(SP)\n";
                    }
                    break;
                case ASSIG:
                    if (!src1.startsWith("\'")) {
                        String destLoc = getLocation(dest);
                        String srcLoc = getLocation(src1);
                        size = vt.varTable.get(Integer.parseInt(dest.substring(1))).size;
                        switch (size) {
                            case 2:
                                instr += "\tmove.w" + " " + srcLoc + ", " + destLoc + "\n";
                                break;
                            case 4:
                                instr += "\tmove.l" + " " + srcLoc + ", " + destLoc + "\n";
                                break;
                            case 32:
                                // Var String = Var String
                                int destinoOff = vt.varTable.get(Integer.parseInt(dest.substring(1))).offset;
                                String regDest = vt.varTable.get(Integer.parseInt(dest.substring(1))).proc == 0 ? "(A5)" : "(A6)";
                                int srcOff = vt.varTable.get(Integer.parseInt(src1.substring(1))).offset;
                                String regSrc = vt.varTable.get(Integer.parseInt(src1.substring(1))).proc == 0 ? "(A5)" : "(A6)";
                                for (int i = 0; i < 32; i += 4) {
                                    instr += "\tmove.l " + (srcOff + i) + regSrc + ", " + (destinoOff + i) + regDest + "\n";
                                }
                                break;
                        }
                    } else {
                        // String
                        int i;
                        int j;
                        int destino = vt.varTable.get(Integer.parseInt(dest.substring(1))).offset;
                        String reg = vt.varTable.get(Integer.parseInt(dest.substring(1))).proc == 0 ? "(A5)" : "(A6)";
                        String stringBuffer = src1.substring(1);
                        for (i = 0; i + 4 <= stringBuffer.length(); i += 4) {
                            instr += "\tmove.l " + "#\'" + stringBuffer.substring(i, i + 4) + "\', " + (destino + i) + reg + "\n";
                        }
                        for (j = i; j < stringBuffer.length(); j++) {
                            instr += "\tmove.b " + "#\'" + stringBuffer.substring(j, j + 1) + "\', " + (destino + j) + reg + "\n";
                        }
                        instr += "\tmove.b " + "#0, " + (destino + j) + reg + "\n";
                    }

                    break;
                case PREFUNCT:
                    instr += "\t;save BP\n";
                    instr += "\tmove.l A6, -(SP)\n"; // Guardamos BP
                    instr += "\t;set BP\n";
                    instr += "\tmove.l SP, A6\n"; // colocamos BP nuevo
                    instr += "\t;save space for local vars\n";
                    instr += "\tsub.l #" + pt.procTable.get(Integer.parseInt(dest)).localSize + ", SP\n"; // colocamos espacio para variables locales
                    break;
                default:
                    return "bad instr: " + op.toString();
            }
            return instr;
        }
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
        eliminarTemporales();
        commutativeNormalization();
        basicBlockIdentification();
        recalcularOfsets();
    }
    
    private void recalcularOfsets(){
        pt.procTable.entrySet().forEach((entry) -> {
            ProcTable.Proc proc = entry.getValue();
            proc.localSize = 0;
        });
        vt.varTable.entrySet().forEach((entry) -> {
            Balde balde = entry.getValue();
            int proc = balde.proc;
            int size = balde.size;
            if (balde.offset < 0) {
                pt.procTable.get(proc).localSize += size;
                balde.offset = -pt.procTable.get(proc).localSize;
            }
            
        });
    }
    
    private boolean isOperation(ThreeAddrIstr tai){
        return ((tai.op == Operand.SUB) || (tai.op == Operand.ADD));
    }
    
    private void eliminarTemporales(){
        ThreeAddrIstr instrCurrent;
        ThreeAddrIstr instrNext;
        instrCurrent = code.get(0);
        for (int i = 1; i < code.size() ; i++) {
            instrNext = code.get(i);
            
            if (instrNext.op == Operand.ASSIG && (instrCurrent.op == Operand.ASSIG || isOperation(instrCurrent) )) {
                if (instrCurrent.dest.equals(instrNext.src1)) {
                    instrNext.src1 = instrCurrent.src1;
                    instrNext.src2 = instrCurrent.src2;
                    // Eliminamos el registro de la TV
                    vt.varTable.remove(Integer.parseInt(instrCurrent.dest.substring(1)));
                    instrNext.op = instrCurrent.op;
                    code.remove(--i);
                }
            }
            instrCurrent = instrNext;
        }
    }

    private void commutativeNormalization() {
        // Commutative operator normalization
        String aux;
        ThreeAddrIstr instr;
        for (int i = 0; i < code.size(); i++) {
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
    }

    private void basicBlockIdentification() {
        ThreeAddrIstr instr;
        // BB initialization
        // Leader identification //
        bbTable.add(new BasicBlock(0, 0)); // I: 0, O: 1
        bbTable.add(new BasicBlock(0, 0));
        for (int i = 0; i < code.size(); i++) {
            instr = code.get(i);
            if (instr.op == Operand.SKIP) {
                labelTable.put(instr.dest, bbTable.size());
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
            String label = instr.dest;
            while (instr.op != Operand.GOTO && !instr.isCondBra()
                    && instr.op != Operand.RETURN && (instr.op != Operand.SKIP
                    || b == labelTable.get(label)) && i < bbTable.size()) {
                instr = code.get(++i);
                label = instr.dest;
            }
            while (instr.isCondBra()) {
                int instrBB = labelTable.get(label);
                bbTable.get(instrBB).addPred(b);
                bbTable.get(b).addSucc(instrBB);
                instr = code.get(++i);
            }
            label = instr.dest;
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
            // Subrutinas de lectura escritura
            writer.print("WRITE_STRING:\n"
                    + "\t;Do the print\n"
                    + "\tmove.l #14, D0\n"
                    + "\tlea 4(SP), A1\n"
                    + "\ttrap #15\n"
                    + "\tmove.b #11, D0\n"
                    + "\tmove.l D7, D1\n"
                    + "\ttrap #15\n"
                    + "\taddq.b #1, D7\n" //D7 stores line number
                    + "\t;give control to caller\n"
                    + "\trts\n");

            writer.print("WRITE_INT:\n"
                    + "\t;Do the print\n"
                    + "\tmove.l #3, D0\n"
                    + "\tmove.l 4(SP), D1\n"
                    + "\ttrap #15\n"
                    + "\tmove.b #11, D0\n"
                    + "\tmove.l D7, D1\n"
                    + "\ttrap #15\n"
                    + "\taddq.b #1, D7\n" //D7 stores line number
                    + "\t;give control to caller\n"
                    + "\trts\n");

            writer.print("READSTRING:\n"
                    + "\t;Do the read\n"
                    + "\tmove #2, D0\n"
                    + "\tmovea.l SP, A1\n"
                    + "\tadd.l #4,A1\n"
                    + "\ttrap #15\n"
                    + "\taddq.b #1, D7\n" //D7 stores line number
                    // Hemos escrito una linea mas
                    + "\t;give control to caller\n"
                    + "\trts\n");

            writer.print("READINT:\n"
                    + "\t;Do the read\n"
                    + "\tmove #4, D0\n"
                    + "\ttrap #15\n"
                    + "\tmove.l D1, 4(SP)\n"
                    + "\taddq.b #1, D7\n" //D7 stores line number
                    // Hemos escrito una linea mas
                    + "\t;give control to caller\n"
                    + "\trts\n");

            // Generamos etiqueta START
            writer.print("START:\n");
            // Initialize line number
            writer.print("\t;Initialize line number\n");
            writer.print("\tmove.l #1, D7\n");
            // Colocamos A6 para indexar el StackPointer
            writer.print("\t;A6 to index variables\n");
            writer.print("\tmove.l SP, A6\n");
            // Colocamos A5 para indexar el StackPointer
            writer.print("\t;A5 to index global variables\n");
            writer.print("\tmove.l SP, A5\n\n");

            // Generamos variables globales 
            // Generamos variables del main
            Balde balde;
            for (Integer id : vt.varTable.keySet()) {
                balde = vt.varTable.get(id);
                // Pertenece al main(Proc = 0)
                if (balde.proc == 0) {
                    // A??adimos comentario
                    writer.print("\t;" + balde.name + " save space in Stack\n");
                    // Asignamos el espacio en la pila
                    writer.print("\tsub.l #" + balde.size + ", SP\n");
                }
            }

            // Generamos codigo de instrucciones
            code.forEach((_item) -> {
                writer.print(_item.get68KCode() + "\n");
            });
            // Generamos codigo de finalizacion de programa
            writer.print("\t;Terminate program\n\tmove #9,D0\n\ttrap #15\n");
            // Generamos codigo de END
            writer.print("\n\tSIMHALT\n\n\n\n\tEND\tSTART");
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
