/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.PrintWriter;

/**
 *
 * @author Ruben, Jaume
 */
public class Compilador {

    static final String OUTPUT_PATH = "fitxersES/outputs/";
    static final String INPUT_PATH = "fitxersES/inputs/";

    static final String TREE_PRINTER_FILEPATH = OUTPUT_PATH + "SYNTAXTREE.txt";
    static final String ERROR_PRINTER_FILEPATH = OUTPUT_PATH + "ERRORS.txt";
    static final String TOKEN_PRINTER_FILEPATH = OUTPUT_PATH + "TOKENS.txt";
    static final String THREE_ADDR_PRINTER_FILEPATH = OUTPUT_PATH + "THREEADDRCODE.txt";
    static final String SYMBOL_TABLE_PRINTER_FILEPATH = OUTPUT_PATH + "SYMBOLTABLE.txt";
    static final String PROC_TABLE_PRINTER_FILEPATH = OUTPUT_PATH + "PROCTABLE.txt";
    static final String VAR_TABLE_PRINTER_FILEPATH = OUTPUT_PATH + "VARTABLE.txt";
    static final String ASSEMBLY_PRINTER_FILEPATH = OUTPUT_PATH + "ASSEMBLY_CODE.X68";
    
    static final String INPUT_FILEPATH = INPUT_PATH + "input.txt";

    public static ErrorPrinter errPrinter;
    public static TreePrinter derTree;
    public static PrintWriter tokenPrinter;

    public static void main(String[] args) {
        String input = INPUT_FILEPATH;
        SyntaxTree sytr = new SyntaxTree();
        try {
            derTree = new TreePrinter(TREE_PRINTER_FILEPATH);
            errPrinter = new ErrorPrinter(ERROR_PRINTER_FILEPATH, input);
            tokenPrinter = new PrintWriter(TOKEN_PRINTER_FILEPATH);
            FileReader in = new FileReader(input);
            Scanner scanner = new Scanner(in);
            Parser parser = new Parser(scanner, sytr);
            parser.parse();
        } catch (FileNotFoundException e) {
            System.err.println("El fitxer d'entrada '" + input + "' no existeix");
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            errPrinter.close();
            derTree.close();
            tokenPrinter.close();
        }

        System.out.println("Errores encontrados: " + errPrinter.erroresEncontrados);

        if (errPrinter.erroresEncontrados == 0) {
            /*en este caso podemos pasar a generar el codigo intermedio
            * unicamente necesitamos traducir las instrucciones que vamos encontrando
             */

            sytr.generateCode();
            sytr.getVt().printOnFile();
            sytr.getPt().printOnFile();
        }
    }
}
