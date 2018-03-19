digito [0-9]
numero {digito}+

%%

{numero} { printf("%s: isso eh um numero!\n", yytext); }

.|\t|\n 

%%

int main(){
	yylex();
}