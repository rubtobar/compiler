/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author Ruben
 */
public class ThreeAddrCode {

    private final ArrayList<ThreeAddrIstr> code;

    private final VarTable vt;
    private final ProcTable pt;
    private final LabelTable lt;

    public enum Operand {
        ADD, SUB, AND, OR, SKIP, GOTO, BLT, BLE, BGE, BGT, BNE, BEQ, CALL, FUN, RETURN, PARAM, ASSIG
    }

    private class ThreeAddrIstr {

        private final Operand op;
        private final String src1;
        private final String src2;
        private final int dest;

        public ThreeAddrIstr(Operand op, String src1, String src2, int dest) {
            this.op = op;
            this.src1 = src1;
            this.src2 = src2;
            this.dest = dest;
        }

        @Override
        public String toString() {

            String ssrc1 = getPrintable(src1), ssrc2 = getPrintable(src2);

            switch (op) {
                case ADD:
                    return dest + " = " + ssrc1 + " + " + ssrc2;
                case SUB:
                    return dest + " = " + ssrc1 + " - " + ssrc2;
                case AND:
                    return dest + " = " + ssrc1 + " & " + ssrc2;
                case OR:
                    return dest + " = " + ssrc1 + " | " + ssrc2;
                case SKIP:
                    return "skip: " + dest;
                case GOTO:
                    return "goto: " + dest;
                case BLT:
                    return "if " + ssrc1 + " < " + ssrc2 + " goto " + dest;
                case BLE:
                    return "if " + ssrc1 + " <= " + ssrc2 + " goto " + dest;
                case BGE:
                    return "if " + ssrc1 + " >= " + ssrc2 + " goto " + dest;
                case BGT:
                    return "if " + ssrc1 + " > " + ssrc2 + " goto " + dest;
                case BNE:
                    return "if " + ssrc1 + " != " + ssrc2 + " goto " + dest;
                case BEQ:
                    return "if " + ssrc1 + " = " + ssrc2 + " goto " + dest;
                case CALL:
                    return "call " + dest;
                case FUN:
                    return dest + " = fun " + ssrc1;
                case RETURN:
                    return "return " + dest;
                case PARAM:
                    return "param " + dest;
                case ASSIG:
                    return dest + " = " + ssrc1;
            }
            return "--:INSTRUCTIONERROR:--";
        }

        /* Donat un argument d'una instrucció, obté un String amb el format per imprimir */
        private String getPrintable(String arg) {
            String s = null;
            if (!arg.equals("")) {
                if (arg.startsWith("v")) {
                    s = vt.varTable.get(Integer.parseInt(arg.substring(1))).name;
                } else if (arg.startsWith("p")) {
                    s = pt.procTable.get(Integer.parseInt(arg.substring(1))).name;
                } else {
                    s = new String(arg);
                }
            }
            return s;
        }
    }

    public ThreeAddrCode(VarTable vt, ProcTable pt, LabelTable lt) {
        code = new ArrayList<>();
        this.vt = vt;
        this.pt = pt;
        this.lt = lt;
    }

    public void add(Operand op, String src1, String src2, int dest) {
        code.add(new ThreeAddrIstr(op, src1, src2, dest));
    }

    public void flush() {
        /*escribir en fichero*/
        PrintWriter writer;
        try {
            writer = new PrintWriter("fitxersES/THREEADDRCODE.txt");
            writer.print(this.toString());
            code.forEach((_item) -> {
                writer.print(_item.toString() + "\n");
            });
            writer.close();
        } catch (FileNotFoundException ex) {
            System.err.println("FALLO DE ESCRITURA EN EL CODIGO DE 3 DIRECCIONES");
        }

    }
}
