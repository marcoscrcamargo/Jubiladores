/* definições */

digito [0-9]
digitos {digito}+
fracao (.{digitos})?
expo ([Ee]([-+])?{digitos})?
numero {digitos}{fracao}{expo}

%%


{numero} {printf("%s: Isso eh numero!\n", yytext);}

.|\t|\n {printf("%s: isso nao eh numero\n", yytext);}

%%

int main(){
	yylex();
}