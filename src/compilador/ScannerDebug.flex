package compilador;
// El codi que es copiarà tal qual al document. A l'inici

import java.io.*;

%%
// Declaracions

string    = \" [^\"]+ \"
digit      = [0-9]
digits     = {digit}+
id         = [A-Za-z_][A-Za-z0-9_]*
openp      = "("
closep     = ")"
openc      = "{"
closec     = "}"
coma       = ","
pcoma      = ";"
if         = "if"
main       = "main"
const      = "const"
op_aritm   = [+-]
op_rel     = [><]
op_log     = [&|]
whitespace = [' ' | '\t']+
line       = "\r\n"			/*windows*/
return     = "return"
equal      = "="


%public             // Per indicar que la classe és pública
%class Scanner      // El nom de la classe
%type Token         // El tipus dels tokens identificats

// El següent codi es copiarà també, dins de la classe. És a dir, si es posa res ha de ser en el format adient: mètodes, atributs, etc. 
%{

	protected int linia = 1;

	public static void main(String []args) {
		if (args.length < 1) {
			System.err.println("Indica un fitxer amb les dades d'entrada");
			System.exit(0);
		}
		try {
			FileReader in = new FileReader(args[0]);
			
			Scanner parser = new Scanner(in);
			parser.yylex();   // <- El mètode d'invocació per començar a parsejar el document
		} catch (FileNotFoundException e) {
			System.err.println("El fitxer d'entrada '"+args[0]+"' no existeix");
		} catch (IOException e) {
			System.err.println("Error processant el fitxer d'entrada");
		}
	}
%}

%%

// Regles/accions

	{whitespace}   {}
	{line}         {linia++;}
	{string}       {System.out.println(linia+": t_String: "   +	yytext().replaceAll("\"", "")); }
	{return}       {System.out.println(linia+": t_return: "	  +	yytext()); }
	{digits}       {System.out.println(linia+": t_digits: "	  +	yytext()); }
	{openp}        {System.out.println(linia+": t_openp: "	  +	yytext()); }
	{closep}       {System.out.println(linia+": t_closep: "	  +	yytext()); }
	{openc}        {System.out.println(linia+": t_openc: "	  +	yytext()); }
	{closec}       {System.out.println(linia+": t_closec: "	  +	yytext()); }
	{coma}         {System.out.println(linia+": t_coma: "	  +	yytext()); }
	{pcoma}        {System.out.println(linia+": t_pcoma: "	  +	yytext()); }
	{if}           {System.out.println(linia+": t_if: "		  +	yytext()); }
	{main}         {System.out.println(linia+": t_main: "	  +	yytext()); }
	{const}        {System.out.println(linia+": t_const: "	  +	yytext()); }
	{op_aritm}     {System.out.println(linia+": t_op_aritm: " +	yytext()); }
	{op_rel}       {System.out.println(linia+": t_op_rel: " +	yytext()); }
	{op_log}       {System.out.println(linia+": t_op_log: "	  +	yytext()); }
	{id}           {System.out.println(linia+": t_id: "		  +	yytext()); }
	{equal}        {System.out.println(linia+": t_equal: "	  +	yytext()); }

    