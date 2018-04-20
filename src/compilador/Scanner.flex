package compilador;
// El codi que es copiarà tal qual al document. A l'inici

import static compilador.Compilador.*;

%%
// Declaracions

string     = (\" ([^\"] | [(\\\")])* \") | (\' ([^\'] | [(\\\')])* \')
digit      = [0-9]
digits     = {digit}+
id         = [A-Za-z_][A-Za-z0-9_]*
openp      = "("
closep     = ")"
leftb      = "{"
rightb     = "}"
coma       = ","
pcoma      = ";"
if         = "if"
while      = "while"
main       = "main"
const      = "const"
op_aritm   = [+-]
op_rel     = < | > | ">=" | "<=" | "!=" | "=="
op_log     = [&\|]
comment	   = ("//"[^"\r\n"]*) | ("/*"[^]*"*/")
whitespace = (\r|\n|\r\n) | [ \t\f]
return     = "return"
equal      = "="

%public             // Per indicar que la classe és pública
%class Scanner      // El nom de la classe
%type Token         // El tipus dels tokens identificats
%line
%column
%eofval{
	return new Token(Token.Tipus.EOF, "", getLine(), getColumn());
%eofval}

// El següent codi es copiarà també, dins de la classe. És a dir, si es posa res ha de ser en el format adient: mètodes, atributs, etc. 
%{

	/*
     * Mètode que s'encarrega d'encapsular la crida a yylex() i que permet 
     *  obtenir el següent token.
     */
    public Token getToken() throws java.io.IOException {
         return this.yylex();
    }

    public int getLine(){
    	return this.yyline+1;
    }

    public int getColumn(){
    	return this.yycolumn+1;
    }

    private void printToken(Token tk) {
        tokenPrinter.print(tk.line+":"+tk.column+": "+tk.getTipus().toString());
        if (tk.getAtribut() != null) {
            tokenPrinter.println(": '"+tk.getAtribut()+"'");
        } else {
            tokenPrinter.println();
        }
        tokenPrinter.flush();
    }
%}

%%

// Regles/accions

	{string}       		
		{
		String cleared = yytext().substring(1, yytext().length()-1);
		cleared = cleared.replaceAll("\\\\("+yytext().charAt(0)+")", "$1");
		Token tk = new Token(Token.Tipus.tk_string,cleared, getLine(), getColumn());
		printToken(tk);
		return tk;
		}
	{return}       		
		{
		Token tk = new Token(Token.Tipus.tk_return, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{digits}       		
		{
		Token tk = new Token(Token.Tipus.tk_digits, this.yytext(), getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{openp}        		
		{
		Token tk = new Token(Token.Tipus.tk_openp, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{closep}       		
		{
		Token tk = new Token(Token.Tipus.tk_closep, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{leftb}        		
		{
		Token tk = new Token(Token.Tipus.tk_leftb, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{rightb}       		
		{
		Token tk = new Token(Token.Tipus.tk_rightb, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{coma}         		
		{
		Token tk = new Token(Token.Tipus.tk_coma, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{pcoma}        		
		{
		Token tk = new Token(Token.Tipus.tk_pcoma, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{if}           		
		{
		Token tk = new Token(Token.Tipus.tk_if, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{while}           		
		{
		Token tk = new Token(Token.Tipus.tk_while, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{main}         		
		{
		Token tk = new Token(Token.Tipus.tk_main, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{const}        		
		{
		Token tk = new Token(Token.Tipus.tk_const, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{equal}        		
		{
		Token tk = new Token(Token.Tipus.tk_equal, null, getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{op_aritm}     		
		{
		Token tk = new Token(Token.Tipus.tk_op_aritm, this.yytext(), getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{op_rel}       		
		{
		Token tk = new Token(Token.Tipus.tk_op_rel, this.yytext(), getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{op_log}       		
		{
		Token tk = new Token(Token.Tipus.tk_op_log, this.yytext(), getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{id}           		
		{
		Token tk = new Token(Token.Tipus.tk_id, this.yytext(), getLine(), getColumn()); 
		printToken(tk);
		return tk;
		}
	{whitespace}   	{ /* Res a fer */ }
	{comment}      	{ /* Res a fer */ }
	.				
		{
		errPrinter.unknownSymbol(getLine(), getColumn(), yytext()); 
		Token tk = new Token(Token.Tipus.ERROR, this.yytext(), getLine(), getColumn());
		}
