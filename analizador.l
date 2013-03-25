%{
	#include <stdio.h>
	
	/*mae tengo mas o menos una idea de como hacer algo que nos ayuda pero no se como 
	  hacer las listas que tengo en mente.
	  Mi idea es algo asi
	  digamos que el archivo es algo asi: <a></a> <b><p></p></b>
	  entonces lo que pienso mejor es hacer listas de listas(eso es lo que no se como hacer)
	  en ese caso quedaria una lista algo asi:
	  
	  ___________________       ______________________________________
	  | _____    ______ |       | _____    _____    ______    ______ |
	  | |<a>| -> |</a>| | ----> | |<b>| -> |<p>| -> |</p>| -> |</b>| |
	  | -----    ------ |       | -----    -----    ------    ------ |
	  -------------------	    --------------------------------------
	  
	  entonces usar esas listas para los analisis.
	  yo mas o menos tengo un seudocodigo para analizarlas, pero ese codigo seria en
	  el caso del analizador sintactico. Lo importante creo yo es lograr esas listas que despues
	  nos van a servir un monton.
	  Yo creo q tambien nos serviria en ese nodo guardar cosas como: linea donde estan,
	  la columna donde estan, entre otros.
	  */
	  
	  
	struct nodo {
		char etiqueta[20];
		struct nodo *siguiente;
	};	
	
	struct node *listaEtiquetas;
	/*listaEtiquetas->siguiente = 0;*/
	
	int linea = 1, columna = 0;
	void count(void);
	void comment(void);
%}

LETRAS			[a-z]

%%

"<!--"				{comment();}
"<"{LETRAS}+">"			{printf("letra %s\n",yytext);}
"</"{LETRAS}+">"		{printf("letra %s\n",yytext);}
\n				{linea++;}

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
			/*printf("correcto\n");*/
			return;
		}
		ante2 = ante1;
		ante1 = c;
	}
	fprintf(stderr,"Error linea %i : comentario sin terminar\n", linea);
}
