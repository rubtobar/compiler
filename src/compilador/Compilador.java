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

    public static ErrorPrinter errPrinter;
    public static TreePrinter derTree;
    public static PrintWriter tokenPrinter;
    
    public static void main(String[] args) {
        String input = "fitxersES/input2.txt";
        SyntaxTree sytr = new SyntaxTree();
        try {
            derTree = new TreePrinter("fitxersES/DERIVATION_TREE.dot");
            errPrinter = new ErrorPrinter("fitxersES/ERRORS.txt",input);
            tokenPrinter = new PrintWriter("fitxersES/TOKENS.txt");
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
        
        if(errPrinter.erroresEncontrados == 0){
            /*en este caso podemos pasar a generar el codigo intermedio
            * unicamente necesitamos traducir las instrucciones que vamos encontrando
            */
            sytr.getVt().printOnFile();
            sytr.getPt().printOnFile();
            sytr.generateCode();
        }
        sytr.codeGen.flush();
    }
}
