/* EXERCÍCIO: escreva a representação em notação científica em apenas uma linha */

numero ("-"|"+")?[0-9]+("."[0-9]+)?(E("-"|"+")?[0-9]+)?

%%


{numero} {printf("%s: Isso eh numero!\n", yytext);}

.|\t|\n {printf("%s: isso nao eh numero\n", yytext);}

%%

int main(){
	yylex();
}