/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import static compilador.Compilador.OUTPUT_PATH;
import static compilador.Compilador.THREE_ADDR_PRINTER_FILENAME;
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

    public enum Operand {
        ADD, SUB, AND, OR, SKIP, GOTO, BLT, BLE, BGE, BGT, BNE, BEQ, CALL, FUN, RETURN, PARAM, ASSIG
    }

    private class ThreeAddrIstr {

        private final Operand op;
        private final String src1;
        private final String src2;
        private final String dest;

        public ThreeAddrIstr(Operand op, String src1, String src2, String dest) {
            this.op = op;
            this.src1 = src1;
            this.src2 = src2;
            this.dest = dest;
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
                } else if (arg.startsWith("'")){
                    s = "\"" + arg.substring(1) + "\"";
                } else {
                    s = new String(arg);
                }
            }
            return s;
        }
    }

    public ThreeAddrCode(VarTable vt, ProcTable pt) {
        code = new ArrayList<>();
        this.vt = vt;
        this.pt = pt;
    }

    public void add(Operand op, String src1, String src2, String dest) {
        code.add(new ThreeAddrIstr(op, src1, src2, dest));
    }

    public void flush() {
        /*escribir en fichero*/
        PrintWriter writer;
        try {
            writer = new PrintWriter(OUTPUT_PATH+THREE_ADDR_PRINTER_FILENAME);
            code.forEach((_item) -> {
                writer.print(_item.toString() + "\n");
            });
            writer.close();
        } catch (FileNotFoundException ex) {
            System.err.println("FALLO DE ESCRITURA EN EL CODIGO DE 3 DIRECCIONES");
        }

    }
}
