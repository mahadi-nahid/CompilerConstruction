%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	#include "parser2.h"
	
	void error_from_lexer(char *);
%}

%option noyywrap

digit [0-9]
letter_ [A-Za-z_]
op [+*/\n-]
dot [.]
%%

{digit}+ {
			char *c = strdup(yytext);
			yylval = atoi(c);
			return INTEGER;
         }
{op} {
		char *c  =  strdup(yytext);
		return *c;
	 }
[ \t]+ ; 

. {
	error_from_lexer("Invalide Character");
  }
%%
