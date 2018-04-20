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
    
    static final String TREE_PRINTER_FILENAME = "SYNTAXTREE.txt";
    static final String ERROR_PRINTER_FILENAME = "ERRORS.txt";
    static final String TOKEN_PRINTER_FILENAME = "TOKENS.txt";
    static final String THREE_ADDR_PRINTER_FILENAME = "THREEADDRCODE.txt";
    static final String SYMBOL_TABLE_PRINTER_FILENAME = "SYMBOLTABLE.txt";
    static final String PROC_TABLE_PRINTER_FILENAME = "PROCTABLE.txt";
    static final String VAR_TABLE_PRINTER_FILENAME = "VARTABLE.txt";
    
    static final String INPUT_FILENAME = "input2.txt";
    
    public static ErrorPrinter errPrinter;
    public static TreePrinter derTree;
    public static PrintWriter tokenPrinter;

    public static void main(String[] args) {
        String input = INPUT_PATH+INPUT_FILENAME;
        SyntaxTree sytr = new SyntaxTree();
        try {
            derTree = new TreePrinter(OUTPUT_PATH+TREE_PRINTER_FILENAME);
            errPrinter = new ErrorPrinter(OUTPUT_PATH+ERROR_PRINTER_FILENAME, input);
            tokenPrinter = new PrintWriter(OUTPUT_PATH+TOKEN_PRINTER_FILENAME);
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
        sytr.codeGen.flush();
    }
}
