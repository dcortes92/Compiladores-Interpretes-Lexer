%{
	#include <stdio.h>
	#include "Tokens.h"
	
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
	  
	  
	struct nodo{
		char etiqueta[20];
		struct nodo *siguiente;
		int linea;
		int columna;
		int largo;
	};
	
	struct node *listaEtiquetas;
	struct node *listaEtiquetasTemporal;
	/*listaEtiquetas->siguiente = 0;*/
	
	int linea = 1, columna = 1;
	void contar(void);
	void comentario(void);
	void error(void);
%}

String		[^<>]
Digito		[0-9]
Espacios	[ ]*
Etiqueta	[a-z][a-z0-9]*{Espacios}
Comillas	[\"]
Atributo	{String}*(\=)?{Espacios}{Comillas}?{String}*{Comillas}?
Apertura	[\<]
AperturaC	[\<][\/]
Cerradura	[\>]
Amp		[\&]
Hash		[\#]
PComa		[\;]

%%

"<!--"																	{comentario();}
"<!DOCTYPE "{Espacios}"html "{Espacios}"PUBLIC ".+">"					{contar();}
{Espacios}																{contar();printf("e 1\n");}
\n																		{contar();printf("e 2\n");}
{Apertura}{Etiqueta}{Atributo}{Cerradura}								{contar();printf("e 3\n");}
{AperturaC}{Etiqueta}{Cerradura}	 									{contar();printf("e 4\n");}
{Amp}{Hash}[1-2]?{Digito}{PComa}										{error();}
{Amp}{Hash}[3][0-1]{PComa}												{error();}
"&#127;"																{error();}
{Amp}{Hash}{String}+{PComa}												{contar();printf("e 5\n");}
{Amp}{String}+{PComa}													{contar();printf("e 6\n");}
"<>"																	{error();}
"</>"																	{error();}
{String}																{contar();printf("e 7\n");}

%%



int main() {
	yylex();
}


void comentario()
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
	fprintf(stderr,"Error en linea %d, columna %d : comentario sin terminar\n", linea, columna);
}

void contar()
{
	int i;
		
	for (i = 0; yytext[i] != '\0'; i++)
	{			
		if (yytext[i] == '\n')
		{
			linea++;
			columna = 1;
		}
		else if (yytext[i] == '\t')
		{
			columna += 8 - (columna % 8);
		}
		else
		{
			columna++;
		}
	}
}

void error()
{	
	fprintf(stderr,"Caracter inválido en linea: %d columna: %d caracter: %s\n", linea, columna, yytext);
	columna += yyleng;
}
