
%%

[0-9]+ { printf("%s: eh um numero inteiro!\n", yytext);}
[0-9]+.[0-9]+ { printf("%s: eh um numero real!\n", yytext);}

%%

int main(){
	yylex();
}