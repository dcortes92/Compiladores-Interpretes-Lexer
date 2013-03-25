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
	  
	  
	struct nodo{
		char etiqueta[20];
		struct nodo *siguiente;
	};
	
	struct node *listaEtiquetas;
	struct node *listaEtiquetasTemporal;
	/*listaEtiquetas->siguiente = 0;*/
	
	int linea = 1, columna = 0;
	void count(void);
	void comentario();
%}



%%

"<!--"				{comentario();}
"<!DOCTYPE".+">"		{printf("Elem: %s\n",yytext);}
"<a>"				{printf("Elem: %s\n",yytext);}
"</a>"				{printf("Elem: %s\n",yytext);}
"<acronym>"			{printf("Elem: %s\n",yytext);}
"</acronym>"			{printf("Elem: %s\n",yytext);}
"<address>"			{printf("Elem: %s\n",yytext);}
"</address>"			{printf("Elem: %s\n",yytext);}
"<area>"			{printf("Elem: %s\n",yytext);}
"</area>"			{printf("Elem: %s\n",yytext);}
"<b>"				{printf("Elem: %s\n",yytext);}
"</b>"				{printf("Elem: %s\n",yytext);}
"<base>"			{printf("Elem: %s\n",yytext);}
"</base>"			{printf("Elem: %s\n",yytext);}
"<bdo>"				{printf("Elem: %s\n",yytext);}
"</bdo>"			{printf("Elem: %s\n",yytext);}
"<big>"				{printf("Elem: %s\n",yytext);}
"</big>"			{printf("Elem: %s\n",yytext);}
"<blockquote>"			{printf("Elem: %s\n",yytext);}
"</blockquote>"			{printf("Elem: %s\n",yytext);}
"<body>"			{printf("Elem: %s\n",yytext);}
"</body>"			{printf("Elem: %s\n",yytext);}
"<br>"				{printf("Elem: %s\n",yytext);}
"</br>"				{printf("Elem: %s\n",yytext);}
"<button>"			{printf("Elem: %s\n",yytext);}
"</button>"			{printf("Elem: %s\n",yytext);}
"<caption>"			{printf("Elem: %s\n",yytext);}
"</caption>"			{printf("Elem: %s\n",yytext);}
"<cite>"			{printf("Elem: %s\n",yytext);}
"</cite>"			{printf("Elem: %s\n",yytext);}
"<code>"			{printf("Elem: %s\n",yytext);}
"</code>"			{printf("Elem: %s\n",yytext);}
"<col>"				{printf("Elem: %s\n",yytext);}
"</col>"			{printf("Elem: %s\n",yytext);}
"<colgroup>"			{printf("Elem: %s\n",yytext);}
"</colgroup>"			{printf("Elem: %s\n",yytext);}
"<dd>"				{printf("Elem: %s\n",yytext);}
"</dd>"				{printf("Elem: %s\n",yytext);}
"<del>"				{printf("Elem: %s\n",yytext);}
"</del>"			{printf("Elem: %s\n",yytext);}
"<div>"				{printf("Elem: %s\n",yytext);}
"</div>"			{printf("Elem: %s\n",yytext);}
"<dfn>"				{printf("Elem: %s\n",yytext);}
"</dfn>"			{printf("Elem: %s\n",yytext);}
"<dl>"				{printf("Elem: %s\n",yytext);}
"</dl>"				{printf("Elem: %s\n",yytext);}
"<dt>"				{printf("Elem: %s\n",yytext);}
"</dt>"				{printf("Elem: %s\n",yytext);}
"<em>"				{printf("Elem: %s\n",yytext);}
"</em>"				{printf("Elem: %s\n",yytext);}
"<fieldset>"			{printf("Elem: %s\n",yytext);}
"</fieldset>"			{printf("Elem: %s\n",yytext);}
"<form>"			{printf("Elem: %s\n",yytext);}
"</form>"			{printf("Elem: %s\n",yytext);}
"<frame>"			{printf("Elem: %s\n",yytext);}
"</frame>"			{printf("Elem: %s\n",yytext);}
"<frameset>"			{printf("Elem: %s\n",yytext);}
"</frameset>"			{printf("Elem: %s\n",yytext);}
"<h"[1-6]">"			{printf("Elem: %s\n",yytext);}
"</h"[1-6]">"			{printf("Elem: %s\n",yytext);}
"<head>"			{printf("Elem: %s\n",yytext);}
"</head>"			{printf("Elem: %s\n",yytext);}
"<hr>"				{printf("Elem: %s\n",yytext);}
"</hr>"				{printf("Elem: %s\n",yytext);}
"<html>"			{printf("Elem: %s\n",yytext);}
"</html>"			{printf("Elem: %s\n",yytext);}
"<i>"				{printf("Elem: %s\n",yytext);}
"</i>"				{printf("Elem: %s\n",yytext);}
"<iframe>"			{printf("Elem: %s\n",yytext);}
"</iframe>"			{printf("Elem: %s\n",yytext);}
"<img>"				{printf("Elem: %s\n",yytext);}
"</img>"			{printf("Elem: %s\n",yytext);}
"<input>"			{printf("Elem: %s\n",yytext);}
"</input>"			{printf("Elem: %s\n",yytext);}
"<ins>"				{printf("Elem: %s\n",yytext);}
"</ins>"			{printf("Elem: %s\n",yytext);}
"<kbd>"				{printf("Elem: %s\n",yytext);}
"</kbd>"			{printf("Elem: %s\n",yytext);}
"<label>"			{printf("Elem: %s\n",yytext);}
"</label>"			{printf("Elem: %s\n",yytext);}
"<legend>"			{printf("Elem: %s\n",yytext);}
"</legend>"			{printf("Elem: %s\n",yytext);}
"<li>"				{printf("Elem: %s\n",yytext);}
"</li>"				{printf("Elem: %s\n",yytext);}
"<link>"			{printf("Elem: %s\n",yytext);}
"</link>"			{printf("Elem: %s\n",yytext);}
"<map>"				{printf("Elem: %s\n",yytext);}
"</map>"			{printf("Elem: %s\n",yytext);}
"<meta>"			{printf("Elem: %s\n",yytext);}
"</meta>"			{printf("Elem: %s\n",yytext);}
"<noframes>"			{printf("Elem: %s\n",yytext);}
"</noframes>"			{printf("Elem: %s\n",yytext);}
"<noscript>"			{printf("Elem: %s\n",yytext);}
"</noscript>"			{printf("Elem: %s\n",yytext);}
"<object>"			{printf("Elem: %s\n",yytext);}
"</object>"			{printf("Elem: %s\n",yytext);}
"<ol>"				{printf("Elem: %s\n",yytext);}
"</ol>"				{printf("Elem: %s\n",yytext);}
"<optgroup>"			{printf("Elem: %s\n",yytext);}
"</optgroup>"			{printf("Elem: %s\n",yytext);}
"<option>"			{printf("Elem: %s\n",yytext);}
"</option>"			{printf("Elem: %s\n",yytext);}
"<p>"				{printf("Elem: %s\n",yytext);}
"</p>"				{printf("Elem: %s\n",yytext);}
"<param>"			{printf("Elem: %s\n",yytext);}
"</param>"			{printf("Elem: %s\n",yytext);}
"<pre>"				{printf("Elem: %s\n",yytext);}
"</pre>"			{printf("Elem: %s\n",yytext);}
"<q>"				{printf("Elem: %s\n",yytext);}
"</q>"				{printf("Elem: %s\n",yytext);}
"<samp>"			{printf("Elem: %s\n",yytext);}
"</samp>"			{printf("Elem: %s\n",yytext);}
"<script>"			{printf("Elem: %s\n",yytext);}
"</script>"			{printf("Elem: %s\n",yytext);}
"<select>"			{printf("Elem: %s\n",yytext);}
"</select>"			{printf("Elem: %s\n",yytext);}
"<small>"			{printf("Elem: %s\n",yytext);}
"</small>"			{printf("Elem: %s\n",yytext);}
"<span>"			{printf("Elem: %s\n",yytext);}
"</span>"			{printf("Elem: %s\n",yytext);}
"<strong>"			{printf("Elem: %s\n",yytext);}
"</strong>"			{printf("Elem: %s\n",yytext);}
"<style>"			{printf("Elem: %s\n",yytext);}
"</style>"			{printf("Elem: %s\n",yytext);}
"<sub>"				{printf("Elem: %s\n",yytext);}
"</sub>"			{printf("Elem: %s\n",yytext);}
"<sup>"				{printf("Elem: %s\n",yytext);}
"</sup>"			{printf("Elem: %s\n",yytext);}
"<table>"			{printf("Elem: %s\n",yytext);}
"</table>"			{printf("Elem: %s\n",yytext);}
"<tbody>"			{printf("Elem: %s\n",yytext);}
"</tbody>"			{printf("Elem: %s\n",yytext);}
"<td>"				{printf("Elem: %s\n",yytext);}
"</td>"				{printf("Elem: %s\n",yytext);}
"<textarea>"			{printf("Elem: %s\n",yytext);}
"</textarea>"			{printf("Elem: %s\n",yytext);}
"<tfoot>"			{printf("Elem: %s\n",yytext);}
"</tfoot>"			{printf("Elem: %s\n",yytext);}
"<th>"				{printf("Elem: %s\n",yytext);}
"</th>"				{printf("Elem: %s\n",yytext);}
"<thead>"			{printf("Elem: %s\n",yytext);}
"</thead>"			{printf("Elem: %s\n",yytext);}
"<title>"			{printf("Elem: %s\n",yytext);}
"</title>"			{printf("Elem: %s\n",yytext);}
"<tr>"				{printf("Elem: %s\n",yytext);}
"</tr>"				{printf("Elem: %s\n",yytext);}
"<tt>"				{printf("Elem: %s\n",yytext);}
"</tt>"				{printf("Elem: %s\n",yytext);}
"<ul>"				{printf("Elem: %s\n",yytext);}
"</ul>"				{printf("Elem: %s\n",yytext);}
"<var>"				{printf("Elem: %s\n",yytext);}
"</var>"			{printf("Elem: %s\n",yytext);}
\n				{linea++;}
.				{fprintf(stderr,"Caracter invalido en linea: %i\n", linea);}

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
	fprintf(stderr,"Error linea %i : comentario sin terminar\n", linea);
}
