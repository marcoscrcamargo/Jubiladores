%{
#include <stdio.h>
#include <string.h>
	
#define false 0
#define true 1

int errors;
%}

digit		[0-9]
letter		[a-zA-Z]
NUM		 	{digit}+
ID  		{letter}+

whitespace [ \t\n]+

%%
"/*" {
	char c;

	do{
		while ((c = input()) != '*');
		while ((c = input()) == '*');
		if (c == '/'){
			break;
		}
	}while (true);
}

{whitespace} {}

else|if|int|return|void|while {
	fprintf(yyout, "%s Palavra-chave\n", yytext);
}

"+"		{ fprintf(yyout, "%s SOMA\n", yytext); }
"-"		{ fprintf(yyout, "%s SUB\n", yytext); }
"*"		{ fprintf(yyout, "%s MUL\n", yytext); }
"/"		{ fprintf(yyout, "%s DIV\n", yytext); }
"<"		{ fprintf(yyout, "%s MENOR\n", yytext); }
"<="	{ fprintf(yyout, "%s MEIGUAL\n", yytext); }
">"		{ fprintf(yyout, "%s MAIOR\n", yytext); }
">="	{ fprintf(yyout, "%s MAIGUAL\n", yytext); }
"=="	{ fprintf(yyout, "%s IGUAL\n", yytext); }
"!="	{ fprintf(yyout, "%s DIF\n", yytext); }
"="		{ fprintf(yyout, "%s ATRIB\n", yytext); }
";"		{ fprintf(yyout, "%s PV\n", yytext); }
","		{ fprintf(yyout, "%s V\n", yytext); }
"("		{ fprintf(yyout, "%s AP\n", yytext); }
")"		{ fprintf(yyout, "%s FP\n", yytext); }
"["		{ fprintf(yyout, "%s ACO\n", yytext); }
"]"		{ fprintf(yyout, "%s FCO\n", yytext); }
"{"		{ fprintf(yyout, "%s ACH\n", yytext); }
"}"		{ fprintf(yyout, "%s FCH\n", yytext); }

{ID}	{ fprintf(yyout, "%s ID\n", yytext); }
{NUM}	{ fprintf(yyout, "%s NUM\n", yytext); }

. {
	errors++;
	fprintf(yyout, "%s ERROR\n", yytext);
}

%%
int main(int argc, char* argv[]){
	if (argc == 2 && strlen(argv[1]) > 3 && !strcmp(argv[1] + strlen(argv[1]) - 3, ".c-")){
		yyin = fopen(argv[1], "r");
		yyout = fopen("relatorio.txt","w");
	}
	else {
		printf("Usage: ./gcc- <filename>.c-\n");
		return 1;
	}

	yylex();
	fprintf(yyout, "%d erro(s) encontrado(s)\n", errors);

	return 0;
}