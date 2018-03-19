%{

#include <stdio.h>
	
%}

%%
[A-Z] { putchar(tolower(yytext[0])); }

%%
int main(){
	yylex();
}