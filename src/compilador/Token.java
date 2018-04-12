
package compilador;

import java_cup.runtime.Symbol;

/**
 * Assignatura 21742 - Compiladors I 
 * Estudis: Grau en Informàtica 
 * Itinerari: Computació 
 * Curs: 2017-2018
 *
 * Professor: Pere Palmer
 */
/**
 * Aquesta classe implementa el concepte de token.
 * 
 * Tot token té un tipus i un atribut
 */
public class Token {

    private final String atribut;
    private final Tipus tipus;
    public final int line;
    public final int column;
    
    /**
     * Els diferents tipus de token contemplats
     */
    public enum Tipus {
        EOF,
        ERROR,
        tk_string,
        tk_return,
        tk_digits,
        tk_openp,
        tk_closep,
        tk_leftb,
        tk_rightb,
        tk_coma,
        tk_pcoma,
        tk_if,
        tk_while,
        tk_main,
        tk_const,
        tk_equal,
        tk_op_aritm,
        tk_op_rel,
        tk_op_log,
        tk_id
    }
    
    /**
     * Constructor
     * @param t el tipus de token de què es tracta
     * @param a el possible atribut
     * @param line
     * @param column
     */
    public Token (Tipus t, String a, int line, int column) {
        this.tipus = t;
        this.line = line;
        this.column = column;
        
        if (a != null)
            this.atribut = a;
        else
            this.atribut = null;
    }

    /**
     * Mètode per determinar quin és l'atribut del token
     * @return l'atribut, que pot ser null
     */
    public String getAtribut() {
        return atribut;
    }

    /**
     * Mètode per determinar el tipus del l'atribut
     * @return el tipus.
     */
    public Tipus getTipus() {
        return tipus;
    }
    
    public java_cup.runtime.Symbol toSymbol(){
        java_cup.runtime.Symbol s = new Symbol(tipus.ordinal(), this);
        return s;
    }
    
    public void print() {
        
    }
    
}
