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

String		[^<>&Ññ]
StringC		[^\"]
Digito		[0-9]
Espacios	[ ]*
Etiqueta	{Espacios}[a-z][a-z0-9]*{Espacios}
Comillas	[\"]
Atributo	{StringC}*(\=){Espacios}{Comillas}{StringC}*{Comillas}|{String}*
Cerradura	[\>]
Amp		[\&]
Hash		[\#]
PComa		[\;]		

%%


"<!DOCTYPE"{String}+">"					{contar();}
[ \n\t]+						{contar();}

"<a>"
"<a "{Atributo}*">"				{contar();}
"</a>"						{contar();}
"<acronym>"
"<acronym "{Atributo}*">"				{contar();}
"</acronym>"						{contar();}
"<address>"
"<address "{Atributo}*">"				{contar();}
"</address>"						{contar();}
"<applet>"
"<applet "{Atributo}*">"				{contar();}
"</applet>"						{contar();}
"<area>"
"<area "{Atributo}*">"				{contar();}
"</area>"						{contar();}
"<b>"
"<b "{Atributo}*">"				{contar();}
"</b>"						{contar();}
"<base>"
"<base "{Atributo}*">"				{contar();}
"</base>"						{contar();}
"<basefont>"
"<basefont "{Atributo}*">"				{contar();}
"</basefont>"						{contar();}
"<bdo>"
"<bdo "{Atributo}*">"				{contar();}
"</bdo>"						{contar();}
"<big>"
"<big "{Atributo}*">"				{contar();}
"</big>"						{contar();}
"<blockquote>"
"<blockquote "{Atributo}*">"				{contar();}
"</blockquote>"						{contar();}
"<body>"
"<body "{Atributo}*">"				{contar();}
"</body>"						{contar();}
"<br>"
"<br "{Atributo}*">"				{contar();}
"</br>"						{contar();}
"<button>"
"<button "{Atributo}*">"				{contar();}
"</button>"						{contar();}
"<caption>"
"<caption "{Atributo}*">"				{contar();}
"</caption>"						{contar();}
"<center>"
"<center "{Atributo}*">"				{contar();}
"</center>"						{contar();}
"<cite>"
"<cite "{Atributo}*">"				{contar();}
"</cite>"						{contar();}
"<code>"
"<code "{Atributo}*">"				{contar();}
"</code>"						{contar();}
"<col>"
"<col "{Atributo}*">"				{contar();}
"</col>"						{contar();}
"<colgroup>"
"<colgroup "{Atributo}*">"				{contar();}
"</colgroup>"						{contar();}
"<dd>"
"<dd "{Atributo}*">"				{contar();}
"</dd>"						{contar();}
"<del>"
"<del "{Atributo}*">"				{contar();}
"</del>"						{contar();}
"<dir>"
"<dir "{Atributo}*">"				{contar();}
"</dir>"						{contar();}
"<div>"
"<div "{Atributo}*">"				{contar();}
"</div>"						{contar();}
"<dfn>"
"<dfn "{Atributo}*">"				{contar();}
"</dfn>"						{contar();}
"<dl>"
"<dl "{Atributo}*">"				{contar();}
"</dl>"						{contar();}
"<dt>"
"<dt "{Atributo}*">"				{contar();}
"</dt>"						{contar();}
"<em>"
"<em "{Atributo}*">"				{contar();}
"</em>"						{contar();}
"<fieldset>"
"<fieldset "{Atributo}*">"				{contar();}
"</fieldset>"						{contar();}
"<font>"
"<font "{Atributo}*">"				{contar();}
"</font>"						{contar();}
"<form>"
"<form "{Atributo}*">"				{contar();}
"</form>"						{contar();}
"<frame>"
"<frame "{Atributo}*">"				{contar();}
"</frame>"						{contar();}
"<frameset>"
"<frameset "{Atributo}*">"				{contar();}
"</frameset>"						{contar();}
"<h1>"
"<h1 "{Atributo}*">"				{contar();}
"</h1>"						{contar();}
"<h2>"
"<h2 "{Atributo}*">"				{contar();}
"</h2>"						{contar();}
"<h3>"
"<h3 "{Atributo}*">"				{contar();}
"</h3>"						{contar();}
"<h4>"
"<h4 "{Atributo}*">"				{contar();}
"</h4>"						{contar();}
"<h5>"
"<h5 "{Atributo}*">"				{contar();}
"</h5>"						{contar();}
"<h6>"
"<h6 "{Atributo}*">"				{contar();}
"</h6>"						{contar();}
"<head>"
"<head "{Atributo}*">"				{contar();}
"</head>"						{contar();}
"<hr>"
"<hr "{Atributo}*">"				{contar();}
"</hr>"						{contar();}
"<html>"
"<html "{Atributo}*">"				{contar();}
"</html>"						{contar();}
"<i>"
"<i "{Atributo}*">"				{contar();}
"</i>"						{contar();}
"<iframe>"
"<iframe "{Atributo}*">"				{contar();}
"</iframe>"						{contar();}
"<img>"
"<img "{Atributo}*">"				{contar();}
"</img>"						{contar();}
"<input>"
"<input "{Atributo}*">"				{contar();}
"</input>"						{contar();}
"<ins>"
"<ins "{Atributo}*">"				{contar();}
"</ins>"						{contar();}
"<isindex>"
"<isindex "{Atributo}*">"				{contar();}
"</isindex>"						{contar();}
"<kbd>"
"<kbd "{Atributo}*">"				{contar();}
"</kbd>"						{contar();}
"<label>"
"<label "{Atributo}*">"				{contar();}
"</label>"						{contar();}
"<legend>"
"<legend "{Atributo}*">"				{contar();}
"</legend>"						{contar();}
"<li>"
"<li "{Atributo}*">"				{contar();}
"</li>"						{contar();}
"<link>"
"<link "{Atributo}*">"				{contar();}
"</link>"						{contar();}
"<map>"
"<map "{Atributo}*">"				{contar();}
"</map>"						{contar();}
"<menu>"
"<menu "{Atributo}*">"				{contar();}
"</menu>"						{contar();}
"<meta>"
"<meta "{Atributo}*">"				{contar();}
"</meta>"						{contar();}
"<noframes>"
"<noframes "{Atributo}*">"				{contar();}
"</noframes>"						{contar();}
"<noscript>"
"<noscript "{Atributo}*">"				{contar();}
"</noscript>"						{contar();}
"<object>"
"<object "{Atributo}*">"				{contar();}
"</object>"						{contar();}
"<ol>"
"<ol "{Atributo}*">"				{contar();}
"</ol>"						{contar();}
"<optgroup>"
"<optgroup "{Atributo}*">"				{contar();}
"</optgroup>"						{contar();}
"<option>"
"<option "{Atributo}*">"				{contar();}
"</option>"						{contar();}
"<p>"
"<p "{Atributo}*">"				{contar();}
"</p>"						{contar();}
"<param>"
"<param "{Atributo}*">"				{contar();}
"</param>"						{contar();}
"<pre>"
"<pre "{Atributo}*">"				{contar();}
"</pre>"						{contar();}
"<q>"
"<q "{Atributo}*">"				{contar();}
"</q>"						{contar();}
"<s>"
"<s "{Atributo}*">"				{contar();}
"</s>"						{contar();}
"<samp>"
"<samp "{Atributo}*">"				{contar();}
"</samp>"						{contar();}
"<script>"
"<script "{Atributo}*">"				{contar();}
"</script>"						{contar();}
"<select>"
"<select "{Atributo}*">"				{contar();}
"</select>"						{contar();}
"<small>"
"<small "{Atributo}*">"				{contar();}
"</small>"						{contar();}
"<span>"
"<span "{Atributo}*">"				{contar();}
"</span>"						{contar();}
"<strike>"
"<strike "{Atributo}*">"				{contar();}
"</strike>"						{contar();}
"<strong>"
"<strong "{Atributo}*">"				{contar();}
"</strong>"						{contar();}
"<style>"
"<style "{Atributo}*">"				{contar();}
"</style>"						{contar();}
"<sub>"
"<sub "{Atributo}*">"				{contar();}
"</sub>"						{contar();}
"<sup>"
"<sup "{Atributo}*">"				{contar();}
"</sup>"						{contar();}
"<table>"
"<table "{Atributo}*">"				{contar();}
"</table>"						{contar();}
"<tbody>"
"<tbody "{Atributo}*">"				{contar();}
"</tbody>"						{contar();}
"<td>"
"<td "{Atributo}*">"				{contar();}
"</td>"						{contar();}
"<textarea>"
"<textarea "{Atributo}*">"				{contar();}
"</textarea>"						{contar();}
"<tfoot>"
"<tfoot "{Atributo}*">"				{contar();}
"</tfoot>"						{contar();}
"<th>"
"<th "{Atributo}*">"				{contar();}
"</th>"						{contar();}
"<thead>"
"<thead "{Atributo}*">"				{contar();}
"</thead>"						{contar();}
"<title>"
"<title "{Atributo}*">"				{contar();}
"</title>"						{contar();}
"<tr>"
"<tr "{Atributo}*">"				{contar();}
"</tr>"						{contar();}
"<tt>"
"<tt "{Atributo}*">"				{contar();}
"</tt>"						{contar();}
"<u>"
"<u "{Atributo}*">"				{contar();}
"</u>"						{contar();}
"<ul>"
"<ul "{Atributo}*">"				{contar();}
"</ul>"						{contar();}
"<var>"
"<var "{Atributo}*">"				{contar();}
"</var>"						{contar();}


{Amp}{Hash}[1-2]?{Digito}{PComa}			{printf("11\n");error();}
{Amp}{Hash}[3][0-1]{PComa}				{printf("22\n");error();}
"&#127;"						{printf("33\n");error();}
"<>"							{printf("44\n");error();}
"</>"							{printf("55\n");error();}

"<"{Etiqueta}{Cerradura}?				{contar();printf("e\n");}
{Atributo}*{Cerradura}					{contar();printf("i\n");}

{Amp}{Hash}{String}+{PComa}				{contar();}
{Amp}{String}+{PComa}					{contar();}


%%

/*{Apertura}{Etiqueta}{Atributo}*{Cerradura}		{contar();printf("e 3\n");}*/
/*{AperturaC}{Etiqueta}{Ceradura}	 		{contar();printf("e 4\n");}*/
/*ERRORES LEXICOS*/

int main(){
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
		else if(c == '\n')
		{
			linea++;
		}
		ante2 = ante1;
		ante1 = c;
	}
	fprintf(stderr,"Error en linea %d, columna %d : comentario sin terminar\n", linea, columna);
}

void separarAtributos()
{
	int comillas = 0;
	char c;
	char* temp;
    	int i;
	while (yytext[i] != '\0')
	{
		if (c == '>'){
			/*printf("correcto\n");*/
			return;
		}
		else if(c == '\"')
		{
			temp += c;
			comillas++;
			if(comillas == 2)
			{
				comillas = 0;
				/*enviar text a otra funcion*/
			}
		}
		else
		{
			temp += c;
		}
		i++;
	}
}

int retornarAtributo(char* c)
{
	
}

void contar()
{
	printf("%s", yytext);
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
