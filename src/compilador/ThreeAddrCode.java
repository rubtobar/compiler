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

    static ArrayList<ThreeAddrIstr> code;

    public enum Operand {
        ADD, SUB, AND, OR, SKIP, GOTO, BLT, BLE, BGE, BGT, BNE, BEQ, CALL, FUN, RETURN, PARAM, ASSIG
    }

    private class ThreeAddrIstr {

        private final Operand op;
        private final int src1;
        private final int src2;
        private final int dest;

        public ThreeAddrIstr(Operand op, int src1, int src2, int dest) {
            this.op = op;
            this.src1 = src1;
            this.src2 = src2;
            this.dest = dest;
        }

        @Override
        public String toString() {
            switch (op) {
                case ADD:
                    return dest + " = " + src1 + " + " + src2;
                case SUB:
                    return dest + " = " + src1 + " - " + src2;
                case AND:
                    return dest + " = " + src1 + " & " + src2;
                case OR:
                    return dest + " = " + src1 + " | " + src2;
                case SKIP:
                    return "skip: " + dest;
                case GOTO:
                    return "goto: " + dest;
                case BLT:
                    return "if " + src1 + " < " + src2 + " goto " + dest;
                case BLE:
                    return "if " + src1 + " <= " + src2 + " goto " + dest;
                case BGE:
                    return "if " + src1 + " >= " + src2 + " goto " + dest;
                case BGT:
                    return "if " + src1 + " > " + src2 + " goto " + dest;
                case BNE:
                    return "if " + src1 + " != " + src2 + " goto " + dest;
                case BEQ:
                    return "if " + src1 + " = " + src2 + " goto " + dest;
                case CALL:
                    return "call " + dest;
                case FUN:
                    return dest + " = fun " + src1;
                case RETURN:
                    return "return " + dest;
                case PARAM:
                    return "param " + dest;
                case ASSIG:
                    return dest + " = " + src1;
            }
            return "--:INSTRUCTIONERROR:--";
        }
    }

    public ThreeAddrCode() {
        code = new ArrayList<>();
    }

    public void add(Operand op, int src1, int src2, int dest) {
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
