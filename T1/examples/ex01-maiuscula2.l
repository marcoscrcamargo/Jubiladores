
%%
[A-Z] { printf("%s: eh uma letra maiuscula!\n", yytext); }

%%

int main(){
	
	yylex();
	
}
