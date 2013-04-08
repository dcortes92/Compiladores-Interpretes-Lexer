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

<<<<<<< HEAD
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
=======
"<!--"							{comentario();}
"<!DOCTYPE"{String}+">"					{contar();}
[ \n\t]+						{contar();}
>>>>>>> 6a38ef06afa8948539a8c7f36c4f035d673474e7

"<a "{Atributo}*">"					{contar();}
"</a>"							{contar();}
"<acronym "{Atributo}*">"				{contar();}
"</acronym>"						{contar();}
"<address "{Atributo}*">"				{contar();}
"</address>"						{contar();}
"<applet "{Atributo}*">"				{contar();}
"</applet>"						{contar();}
"<area "{Atributo}*">"					{contar();}
"</area>"						{contar();}
"<b "{Atributo}*">"					{contar();}
"</b>"							{contar();}
"<base "{Atributo}*">"					{contar();}
"</base>"						{contar();}
"<basefont "{Atributo}*">"				{contar();}
"</basefont>"						{contar();}
"<bdo "{Atributo}*">"					{contar();}
"</bdo>"						{contar();}
"<big "{Atributo}*">"					{contar();}
"</big>"						{contar();}
"<blockquote "{Atributo}*">"				{contar();}
"</blockquote>"						{contar();}
"<body "{Atributo}*">"					{contar();}
"</body>"						{contar();}
"<br "{Atributo}*">"					{contar();}
"</br>"							{contar();}
"<button "{Atributo}*">"				{contar();}
"</button>"						{contar();}
"<caption "{Atributo}*">"				{contar();}
"</caption>"						{contar();}
"<center "{Atributo}*">"				{contar();}
"</center>"						{contar();}
"<cite "{Atributo}*">"					{contar();}
"</cite>"						{contar();}
"<code "{Atributo}*">"					{contar();}
"</code>"						{contar();}
"<col "{Atributo}*">"					{contar();}
"</col>"						{contar();}
"<colgroup "{Atributo}*">"				{contar();}
"</colgroup>"						{contar();}
"<dd "{Atributo}*">"					{contar();}
"</dd>"							{contar();}
"<del "{Atributo}*">"					{contar();}
"</del>"						{contar();}
"<dir "{Atributo}*">"					{contar();}
"</dir>"						{contar();}
"<div "{Atributo}*">"					{contar();}
"</div>"						{contar();}
"<dfn "{Atributo}*">"					{contar();}
"</dfn>"						{contar();}
"<dl "{Atributo}*">"					{contar();}
"</dl>"							{contar();}
"<dt "{Atributo}*">"					{contar();}
"</dt>"							{contar();}
"<em "{Atributo}*">"					{contar();}
"</em>"							{contar();}
"<fieldset "{Atributo}*">"				{contar();}
"</fieldset>"						{contar();}
"<font "{Atributo}*">"					{contar();}
"</font>"						{contar();}
"<form "{Atributo}*">"					{contar();}
"</form>"						{contar();}
"<frame "{Atributo}*">"					{contar();}
"</frame>"						{contar();}
"<frameset "{Atributo}*">"				{contar();}
"</frameset>"						{contar();}
"<h1 "{Atributo}*">"					{contar();}
"</h1>"							{contar();}
"<h2 "{Atributo}*">"					{contar();}
"</h2>"							{contar();}
"<h3 "{Atributo}*">"					{contar();}
"</h3>"							{contar();}
"<h4 "{Atributo}*">"					{contar();}
"</h4>"							{contar();}
"<h5 "{Atributo}*">"					{contar();}
"</h5>"							{contar();}
"<h6 "{Atributo}*">"					{contar();}
"</h6>"							{contar();}
"<head "{Atributo}*">"					{contar();}
"</head>"						{contar();}
"<hr "{Atributo}*">"					{contar();}
"</hr>"							{contar();}
"<html "{Atributo}*">"					{contar();}
"</html>"						{contar();}
"<i "{Atributo}*">"					{contar();}
"</i>"							{contar();}
"<iframe "{Atributo}*">"				{contar();}
"</iframe>"						{contar();}
"<img "{Atributo}*">"					{contar();}
"</img>"						{contar();}
"<input "{Atributo}*">"					{contar();}
"</input>"						{contar();}
"<ins "{Atributo}*">"					{contar();}
"</ins>"						{contar();}
"<isindex "{Atributo}*">"				{contar();}
"</isindex>"						{contar();}
"<kbd "{Atributo}*">"					{contar();}
"</kbd>"						{contar();}
"<label "{Atributo}*">"					{contar();}
"</label>"						{contar();}
"<legend "{Atributo}*">"				{contar();}
"</legend>"						{contar();}
"<li "{Atributo}*">"					{contar();}
"</li>"							{contar();}
"<link "{Atributo}*">"					{contar();}
"</link>"						{contar();}
"<map "{Atributo}*">"					{contar();}
"</map>"						{contar();}
"<menu "{Atributo}*">"					{contar();}
"</menu>"						{contar();}
"<meta "{Atributo}*">"					{contar();}
"</meta>"						{contar();}
"<noframes "{Atributo}*">"				{contar();}
"</noframes>"						{contar();}
"<noscript "{Atributo}*">"				{contar();}
"</noscript>"						{contar();}
"<object "{Atributo}*">"				{contar();}
"</object>"						{contar();}
"<ol "{Atributo}*">"					{contar();}
"</ol>"							{contar();}
"<optgroup "{Atributo}*">"				{contar();}
"</optgroup>"						{contar();}
"<option "{Atributo}*">"				{contar();}
"</option>"						{contar();}
"<p "{Atributo}*">"					{contar();}
"</p>"							{contar();}
"<param "{Atributo}*">"					{contar();}
"</param>"						{contar();}
"<pre "{Atributo}*">"					{contar();}
"</pre>"						{contar();}
"<q "{Atributo}*">"					{contar();}
"</q>"							{contar();}
"<s "{Atributo}*">"					{contar();}
"</s>"							{contar();}
"<samp "{Atributo}*">"					{contar();}
"</samp>"						{contar();}
"<script "{Atributo}*">"				{contar();}
"</script>"						{contar();}
"<select "{Atributo}*">"				{contar();}
"</select>"						{contar();}
"<small "{Atributo}*">"					{contar();}
"</small>"						{contar();}
"<span "{Atributo}*">"					{contar();}
"</span>"						{contar();}
"<strike "{Atributo}*">"				{contar();}
"</strike>"						{contar();}
"<strong "{Atributo}*">"				{contar();}
"</strong>"						{contar();}
"<style "{Atributo}*">"					{contar();}
"</style>"						{contar();}
"<sub "{Atributo}*">"					{contar();}
"</sub>"						{contar();}
"<sup "{Atributo}*">"					{contar();}
"</sup>"						{contar();}
"<table "{Atributo}*">"					{contar();}
"</table>"						{contar();}
"<tbody "{Atributo}*">"					{contar();}
"</tbody>"						{contar();}
"<td "{Atributo}*">"					{contar();}
"</td>"							{contar();}
"<textarea "{Atributo}*">"				{contar();}
"</textarea>"						{contar();}
"<tfoot "{Atributo}*">"					{contar();}
"</tfoot>"						{contar();}
"<th "{Atributo}*">"					{contar();}
"</th>"							{contar();}
"<thead "{Atributo}*">"					{contar();}
"</thead>"						{contar();}
"<title "{Atributo}*">"					{contar();}
"</title>"						{contar();}
"<tr "{Atributo}*">"					{contar();}
"</tr>"							{contar();}
"<tt "{Atributo}*">"					{contar();}
"</tt>"							{contar();}
"<u "{Atributo}*">"					{contar();}
"</u>"							{contar();}
"<ul "{Atributo}*">"					{contar();}
"</ul>"							{contar();}
"<var "{Atributo}*">"					{contar();}
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

.+							{printf("oo\n");error();}

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
