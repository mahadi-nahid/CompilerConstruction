%option noyywrap

digit [0-9]
letter_ [A-Za-z_]
op [+*/]
dot [.]
%%
hello printf("Hello World\n");
 
{op} printf("OP\n");

{digit}+ printf("number\n");

if {if(1) printf("true"); else printf("false");}

{letter_}({letter_}|{digit})* printf("Identifier\n");

{digit}+[.]{digit}+(e[+-]?{digit}+[.]{digit}+)? printf("Float\n");

({letter_}|{digit}|{dot})+@({letter_}|{digit})+{dot}("com"|"org"|"edu.bd") printf("valid Email\n");
. ;
\n ;
%%

int main(){
	yylex();
	return 0;
}