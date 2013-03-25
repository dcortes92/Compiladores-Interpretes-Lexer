%{
	#include <stdio.h>
	
	int linea = 1, columna = 0;
	void count(void);
	void comment(void);
%}

%%
"<!--"			{ comment(); }
\n			{linea++;}


%%


int main() {
	yylex();
}

void comment(void)
{
	char c, ante1 = 0, ante2 = 0;
  
	while ((c = input()) != EOF)
	{
		if (c == '>' && ante1 == '-' && ante2 == '-'){
			printf("correcto");
			return;
		}
		ante2 = ante1;
		ante1 = c;
	}
	fprintf(stderr,"Error linea %i : comentario sin terminar\n", linea);
}
