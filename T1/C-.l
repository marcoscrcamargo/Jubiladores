%{

#include <stdio.h>
	
#ifndef FALSE
	#define FALSE 0
#endif
#ifndef TRUE
	#define TRUE 1
#endif

int errors = 0;

void yyerror(char *s);

%}

digit		[0-9]
letter		[a-zA-Z]
NUM		 	{digit}+
ID  		{letter}+

newline		\n
whitespace  [ \t]+

%%
"/*" {
	char c;
	int end = FALSE;
	do{
		while ((c = input()) != '*');
		while ((c = input()) == '*');
		if (c == '/')
			end = TRUE;
	}while(!end);
}

{newline}		{}
{whitespace} 	{}

"else"		{ fprintf(yyout, "%s ELSE\n", yytext); }
"if"		{ fprintf(yyout, "%s IF\n", yytext); }
"int"		{ fprintf(yyout, "%s INT\n", yytext); }
"return"	{ fprintf(yyout, "%s RETURN\n", yytext); }
"void"		{ fprintf(yyout, "%s VOID\n", yytext); }
"while"		{ fprintf(yyout, "%s while\n", yytext); }
"input"		{ fprintf(yyout, "%s INPUT\n", yytext); }
"output"	{ fprintf(yyout, "%s OUTPUT\n", yytext); }

"+"			{ fprintf(yyout, "%s SOMA\n", yytext); }
"-"			{ fprintf(yyout, "%s SUB\n", yytext); }
"*"			{ fprintf(yyout, "%s MUL\n", yytext); }
"/"			{ fprintf(yyout, "%s DIV\n", yytext); }
"<"			{ fprintf(yyout, "%s MENOR\n", yytext); }
"<="		{ fprintf(yyout, "%s MEIGUAL\n", yytext); }
">"			{ fprintf(yyout, "%s MAIOR\n", yytext); }
">="		{ fprintf(yyout, "%s MAIGUAL\n", yytext); }
"=="		{ fprintf(yyout, "%s IGUAL\n", yytext); }
"!="		{ fprintf(yyout, "%s DIF\n", yytext); }
"="			{ fprintf(yyout, "%s ATRIB\n", yytext); }
";"			{ fprintf(yyout, "%s PV\n", yytext); }
","			{ fprintf(yyout, "%s ,\n", yytext); }
"("			{ fprintf(yyout, "%s AP\n", yytext); }
")"			{ fprintf(yyout, "%s FP\n", yytext); }
"["			{ fprintf(yyout, "%s AC\n", yytext); }
"]"			{ fprintf(yyout, "%s FC\n", yytext); }
"{"			{ fprintf(yyout, "%s ACH\n", yytext); }
"}"			{ fprintf(yyout, "%s FCH\n", yytext); }

{ID}			{ fprintf(yyout, "%s ID\n", yytext); }
{NUM}			{ fprintf(yyout, "%s NUM\n", yytext); }


.  { yyerror(yytext); }

%%
void yyerror(char *s) {
    errors = errors + 1;
	fprintf(yyout, "%s ERROR\n", s);
}

int main(int argc, char* argv[]){
	if (argc > 1){
		yyin = fopen(argv[1], "r");
		yyout = fopen ("relatorio.txt","w");
	}
	else {
		printf("Usage: ./gcc- filename.c-\n");
		return 1;
	}

	yylex();
	fprintf(yyout, "%d erro(s) encontrado(s)\n", errors);

	return 0;
}