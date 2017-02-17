%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	
	void error_from_lexer(char *);
	void yyerror(const char *);
%}

%token INTEGER

%left '+' '-' 
%left '*' '/' 
%error-verbose
%%

program:	program E '\n' {
								printf("%d\n", $2);
						   }
	        | ;

E:	E '+' E {
				$$ = $1 + $3;
			}
	| E '-' E {
				$$ = $1 - $3;
			}
	| E '*' E {
				$$ = $1 * $3;
			}
			
	| E '/' E {
				$$ = $1 / $3;
			}
	| INTEGER {
			   $$ = $1;
			  }
    ;
%%

int main()
{
	yyparse();
	return 0;
}



void yyerror(const char * c){
	printf("%s\n",c);
	return;
}

void error_from_lexer(char *c)
{
	printf("%s\n", c);
}

