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

%%

"<!--"				{comentario();}
"<!DOCTYPE".+">"		{contar();}
"<a>"				{printf("%d\n", A);return A;}
"</a>"				{contar();}
"<acronym>"			{contar();}
"</acronym>"			{contar();}
"<address>"			{contar();}
"</address>"			{contar();}
"<area>"			{contar();}
"</area>"			{contar();}
"<b>"				{contar();}
"</b>"				{contar();}
"<base>"			{contar();}
"</base>"			{contar();}
"<bdo>"				{contar();}
"</bdo>"			{contar();}
"<big>"				{contar();}
"</big>"			{contar();}
"<blockquote>"			{contar();}
"</blockquote>"			{contar();}
"<body>"			{contar();}
"</body>"			{contar();}
"<br>"				{contar();}
"</br>"				{contar();}
"<button>"			{contar();}
"</button>"			{contar();}
"<caption>"			{contar();}
"</caption>"			{contar();}
"<cite>"			{contar();}
"</cite>"			{contar();}
"<code>"			{contar();}
"</code>"			{contar();}
"<col>"				{contar();}
"</col>"			{contar();}
"<colgroup>"			{contar();}
"</colgroup>"			{contar();}
"<dd>"				{contar();}
"</dd>"				{contar();}
"<del>"				{contar();}
"</del>"			{contar();}
"<div>"				{contar();}
"</div>"			{contar();}
"<dfn>"				{contar();}
"</dfn>"			{contar();}
"<dl>"				{contar();}
"</dl>"				{contar();}
"<dt>"				{contar();}
"</dt>"				{contar();}
"<em>"				{contar();}
"</em>"				{contar();}
"<fieldset>"			{contar();}
"</fieldset>"			{contar();}
"<form>"			{contar();}
"</form>"			{contar();}
"<frame>"			{contar();}
"</frame>"			{contar();}
"<frameset>"			{contar();}
"</frameset>"			{contar();}
"<h"[1-6]">"			{contar();}
"</h"[1-6]">"			{contar();}
"<head>"			{contar();}
"</head>"			{contar();}
"<hr>"				{contar();}
"</hr>"				{contar();}
"<html>"			{contar();}
"<html".+">"			{contar();}
"</html>"			{contar();}
"<i>"				{contar();}
"</i>"				{contar();}
"<iframe>"			{contar();}
"</iframe>"			{contar();}
"<img>"				{contar();}
"</img>"			{contar();}
"<input>"			{contar();}
"</input>"			{contar();}
"<ins>"				{contar();}
"</ins>"			{contar();}
"<kbd>"				{contar();}
"</kbd>"			{contar();}
"<label>"			{contar();}
"</label>"			{contar();}
"<legend>"			{contar();}
"</legend>"			{contar();}
"<li>"				{contar();}
"</li>"				{contar();}
"<link>"			{contar();}
"</link>"			{contar();}
"<map>"				{contar();}
"</map>"			{contar();}
"<meta>"			{contar();}
"</meta>"			{contar();}
"<noframes>"			{contar();}
"</noframes>"			{contar();}
"<noscript>"			{contar();}
"</noscript>"			{contar();}
"<object>"			{contar();}
"</object>"			{contar();}
"<ol>"				{contar();}
"</ol>"				{contar();}
"<optgroup>"			{contar();}
"</optgroup>"			{contar();}
"<option>"			{contar();}
"</option>"			{contar();}
"<p>"				{contar();}
"</p>"				{contar();}
"<param>"			{contar();}
"</param>"			{contar();}
"<pre>"				{contar();}
"</pre>"			{contar();}
"<q>"				{contar();}
"</q>"				{contar();}
"<samp>"			{contar();}
"</samp>"			{contar();}
"<script>"			{contar();}
"</script>"			{contar();}
"<select>"			{contar();}
"</select>"			{contar();}
"<small>"			{contar();}
"</small>"			{contar();}
"<span>"			{contar();}
"</span>"			{contar();}
"<strong>"			{contar();}
"</strong>"			{contar();}
"<style>"			{contar();}
"</style>"			{contar();}
"<sub>"				{contar();}
"</sub>"			{contar();}
"<sup>"				{contar();}
"</sup>"			{contar();}
"<table>"			{contar();}
"</table>"			{contar();}
"<tbody>"			{contar();}
"</tbody>"			{contar();}
"<td>"				{contar();}
"</td>"				{contar();}
"<textarea>"			{contar();}
"</textarea>"			{contar();}
"<tfoot>"			{contar();}
"</tfoot>"			{contar();}
"<th>"				{contar();}
"</th>"				{contar();}
"<thead>"			{contar();}
"</thead>"			{contar();}
"<title>"			{contar();}
"</title>"			{contar();}
"<tr>"				{contar();}
"</tr>"				{contar();}
"<tt>"				{contar();}
"</tt>"				{contar();}
"<ul>"				{contar();}
"</ul>"				{contar();}
"<var>"				{contar();}
"</var>"			{contar();}
[ \t\v\n\f]			{contar();}
"&#127;"			{error();}
"&#0"[0-9]";"			{error();}
"&#1"[0-9]";"			{error();}
"&#2"[0-9]";"			{error();}
"&#3"[0-1]";"			{error();}
"&#".+""			{contar();}
"&".+""				{contar();}
"<>"				{error();}
"</>"				{error();}
.				{error();}

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
