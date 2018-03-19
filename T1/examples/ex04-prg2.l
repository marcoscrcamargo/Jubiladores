%{

#include <stdio.h>
	
#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE 1
#endif

%}

%%
[A-Z] { putchar(tolower(yytext[0])); }

"/*" {

	char c;
	int ok = FALSE;
	ECHO;
	do{
		while ((c=input()) != '*')
			putchar(c);
		putchar(c);
		while ((c=input()) == '*')
			putchar(c);
		putchar(c);
		if (c == '/')
			ok = TRUE;
	}while(!ok);

}


%%
int main(){
	yylex();
}