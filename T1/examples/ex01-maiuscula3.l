
%%
[A-Z] { printf("%s: eh uma letra maiuscula!\n", yytext); }
[a-z] { printf("%s: nao eh uma letra maiuscula!\n", yytext); }
%%

int main(){
	
	yylex();
	
}
