%{

/* Comentários */

%}

%%

[\t ]+

[a-zA-Z]+("ar"|"er"|"ir") { printf("%s: eh um verbo\n", yytext); }

[a-zA-Z]+ { printf("%s: nao eh um verbo\n", yytext); }

.|\n 

%%

int main()
{

	yylex();

}