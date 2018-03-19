%{

#include <stdio.h>
	
#ifndef FALSE
	#define FALSE 0
#endif
#ifndef TRUE
	#define TRUE 1
#endif
int errors = 0;
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

"else"		{ printf("%s ELSE\n", yytext); }
"if"		{ printf("%s IF\n", yytext); }
"int"		{ printf("%s INT\n", yytext); }
"return"	{ printf("%s RETURN\n", yytext); }
"void"		{ printf("%s VOID\n", yytext); }
"while"		{ printf("%s while\n", yytext); }
"input"		{ printf("%s INPUT\n", yytext); }
"output"	{ printf("%s OUTPUT\n", yytext); }

"+"			{ printf("%s SOMA\n", yytext); }
"-"			{ printf("%s SUB\n", yytext); }
"*"			{ printf("%s MUL\n", yytext); }
"/"			{ printf("%s DIV\n", yytext); }
"<"			{ printf("%s MENOR\n", yytext); }
"<="		{ printf("%s MEIGUAL\n", yytext); }
">"			{ printf("%s MAIOR\n", yytext); }
">="		{ printf("%s MAIGUAL\n", yytext); }
"=="		{ printf("%s IGUAL\n", yytext); }
"!="		{ printf("%s DIF\n", yytext); }
"="			{ printf("%s ATRIB\n", yytext); }
";"			{ printf("%s PV\n", yytext); }
","			{ printf("%s ,\n", yytext); }
"("			{ printf("%s AP\n", yytext); }
")"			{ printf("%s FP\n", yytext); }
"["			{ printf("%s AC\n", yytext); }
"]"			{ printf("%s FC\n", yytext); }
"{"			{ printf("%s ACH\n", yytext); }
"}"			{ printf("%s FCH\n", yytext); }

{ID}			{ printf("%s ID\n", yytext); }
{NUM}			{ printf("%s NUM\n", yytext); }


.  { yyerror(yytext); }

%%
void yyerror(char *s) {
    errors = errors + 1;
	printf("%s ERROR\n", s);
}

int main(){
	yylex();
	printf("%d erro\(s\) encontrado\(s\)\n", errors);
}