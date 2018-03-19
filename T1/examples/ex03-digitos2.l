
%%

[0-9]+ { printf("%s: eh um numero inteiro!\n", yytext);}
[0-9]+.[0-9] { printf("%s: eh um numero real!\n", yytext);}
[0-9]+.[0-9]+(E[-+]*[0-9]+)? { printf("%s: notacao cientifica!\n", yytext);}

.|\t|\n 

%%

int main(){
	yylex();
}