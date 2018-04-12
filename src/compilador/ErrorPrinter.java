/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JaumeFerrerGomila
 * @author RubenTobarNicolau
 */
public class ErrorPrinter {

    private PrintWriter writer;
    FileReader in;
    BufferedReader br;
    ArrayList<String> codigo;
    public int erroresEncontrados;

    public ErrorPrinter(String file, String asd) {
        erroresEncontrados = 0;
        codigo = new ArrayList<>();
        try {
            writer = new PrintWriter(file);
            in = new FileReader(asd);
            br = new BufferedReader(in);
            String line = br.readLine();
            while (line != null) {                
                codigo.add(line);
                line = br.readLine();
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(ErrorPrinter.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ErrorPrinter.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void missingReturn(int line, int column, String nomProc) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nMissing return statement in function '"+ nomProc+"'\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void unexpectedReturn(int line, int column) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nUnexpected return statement\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void nonExistingType(int line, int column, String found) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nNon existing type '"+found+"'\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void undeclaredVariable(int line, int column, String var) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nUndeclared variable '"+var+"'\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void undeclaredFunction(int line, int column, String function) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nundeclared function '"+function+"'\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void alreadyDeclaredFunction(int line, int column, String nomProc) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nAlready declared function '"+ nomProc+"'\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void alreadyDeclaredVariable(int line, int column, String nomVar) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nAlready declared variable '"+ nomVar+"'\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void alreadyDeclaredArgument(int line, int column, String nomProc ,String nomArg) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nAlready declared argument '"+nomArg+"' in function '"+ nomProc+"'\n");
        writer.flush();
        erroresEncontrados++;
    }    
    
    public void reservedVariableName(int line, int column, String nomVar) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nVariable name '"+nomVar+"' is reserved word\n");
        writer.flush();
        erroresEncontrados++;
    }
        
    public void reservedFunctionName(int line, int column, String nomProc) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nFunction name '"+nomProc+"' is reserved word\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void reservedArgumentName(int line, int column, String nomProc ,String nomArg) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nArgument name '"+nomArg+"' is a reserved word\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void assigmentToConst(int line, int column, String constant) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nTrying to reasign to constant '"+constant+"'\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void unexpectedValueType(int line, int column, String found, String expected) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR: Unexpected value type. Expected: "+expected+", Found: "+found+"\n"
            + "> " + codigo.get(line-1)+"\n");
        writer.flush();
        erroresEncontrados++;
    }
        

    public void unexpectedArgType(int line, int column, String found, String expected) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR: Unexpected argument type. Expected: "+expected+", Found: "+found
            +"\n> " + codigo.get(line-1)+"\n");
        writer.flush();
        erroresEncontrados++;
    }
        

    public void unexpectedReturnType(int line, int column, String nomProc, String found, String expected) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR: Unexpected return type in function '"+ nomProc+"'. Expected: "
            +expected+", Found: "+ found + "\n> " + codigo.get(line-1)+"\n");
        writer.flush();
        erroresEncontrados++;
    }
        

    public void notALogicStatement(int line, int column, String found) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR: Not a logic statement. Type found: '"+found+"'\n"
            + "> " + codigo.get(line-1)+"\n");
        writer.flush();
        erroresEncontrados++;
    }
        

    public void tooFewArgs(int line, int column, String function) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nToo few arguments to function '"+function+"'\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void tooManyArgs(int line, int column, String function) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nToo many arguments to function '"+function+"'\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void tooManyArgs(int line, int column) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nToo many arguments to function\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void overflow(int line, int column, String literal) {
        writer.println(line + ":" + column + ": SEMANTIC ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nInteger overflow. Valid value range is [–2147483648, 2147483647]. Found '"+literal+"'\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void unknownSymbol(int line, int column, String symbol) {
        writer.println(line + ":" + column + ": LEXICAL ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nUnknown symbol '"+symbol+"'\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void unexpectedSentence(int line, int column) {
        writer.println(line + ":" + column + ": SYNTAX ERROR:   "
//            + "> " + codigo.get(line-1)
            + "Not a sentence\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void unexpectedArguments(int line, int column) {
        writer.println(line + ":" + column + ": SYNTAX ERROR:   "
//            + "> " + codigo.get(line-1)
            + "Bad argument declaration\n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void badBlockInstructions(int line, int column, String symbol) {
        writer.println(line + ":" + column + ": SYNTAX ERROR:   "
//            + "> " + codigo.get(line-1)
            + "Incorrect syntax in function "+symbol+" statements \n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void badDeclaration(int line, int column) {
        writer.println(line + ":" + column + ": SYNTAX ERROR:\n"
            + "> " + codigo.get(line-1)
            + "\nIncorrect syntax in declaration \n");
        writer.flush();
        erroresEncontrados++;
    }
    
    public void badMainSyntax(int line, int column) {
        writer.println(line + ":" + column + ": SYNTAX ERROR:   "
//            + "> " + codigo.get(line-1)
            + "Incorrect syntax in main \n");
        writer.flush();
        erroresEncontrados++;
    }
    
    
    
    public void close(){
        writer.close();
        
        try {
            br.close();
            in.close();
        } catch (IOException ex) {
            Logger.getLogger(ErrorPrinter.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
