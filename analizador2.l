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

"<a>"					{contar();printf("Encontro tag A en linea: %d y columna: %d",linea, columna)}
"<a "{Atributo}*">"				{contar();printf("Encontro tag A en linea: %d y columna: %d",linea, columna)}
"</a>"					{contar();printf("Encontro tag A en linea: %d y columna: %d",linea, columna)}
"<acronym>"					{contar();printf("Encontro tag ACRONYM en linea: %d y columna: %d",linea, columna)}
"<acronym "{Atributo}*">"				{contar();printf("Encontro tag ACRONYM en linea: %d y columna: %d",linea, columna)}
"</acronym>"					{contar();printf("Encontro tag ACRONYM en linea: %d y columna: %d",linea, columna)}
"<address>"					{contar();printf("Encontro tag ADDRESS en linea: %d y columna: %d",linea, columna)}
"<address "{Atributo}*">"				{contar();printf("Encontro tag ADDRESS en linea: %d y columna: %d",linea, columna)}
"</address>"					{contar();printf("Encontro tag ADDRESS en linea: %d y columna: %d",linea, columna)}
"<applet>"					{contar();printf("Encontro tag APPLET en linea: %d y columna: %d",linea, columna)}
"<applet "{Atributo}*">"				{contar();printf("Encontro tag APPLET en linea: %d y columna: %d",linea, columna)}
"</applet>"					{contar();printf("Encontro tag APPLET en linea: %d y columna: %d",linea, columna)}
"<area>"					{contar();printf("Encontro tag AREA en linea: %d y columna: %d",linea, columna)}
"<area "{Atributo}*">"				{contar();printf("Encontro tag AREA en linea: %d y columna: %d",linea, columna)}
"</area>"					{contar();printf("Encontro tag AREA en linea: %d y columna: %d",linea, columna)}
"<b>"					{contar();printf("Encontro tag B en linea: %d y columna: %d",linea, columna)}
"<b "{Atributo}*">"				{contar();printf("Encontro tag B en linea: %d y columna: %d",linea, columna)}
"</b>"					{contar();printf("Encontro tag B en linea: %d y columna: %d",linea, columna)}
"<base>"					{contar();printf("Encontro tag BASE en linea: %d y columna: %d",linea, columna)}
"<base "{Atributo}*">"				{contar();printf("Encontro tag BASE en linea: %d y columna: %d",linea, columna)}
"</base>"					{contar();printf("Encontro tag BASE en linea: %d y columna: %d",linea, columna)}
"<basefont>"					{contar();printf("Encontro tag BASEFONT en linea: %d y columna: %d",linea, columna)}
"<basefont "{Atributo}*">"				{contar();printf("Encontro tag BASEFONT en linea: %d y columna: %d",linea, columna)}
"</basefont>"					{contar();printf("Encontro tag BASEFONT en linea: %d y columna: %d",linea, columna)}
"<bdo>"					{contar();printf("Encontro tag BDO en linea: %d y columna: %d",linea, columna)}
"<bdo "{Atributo}*">"				{contar();printf("Encontro tag BDO en linea: %d y columna: %d",linea, columna)}
"</bdo>"					{contar();printf("Encontro tag BDO en linea: %d y columna: %d",linea, columna)}
"<big>"					{contar();printf("Encontro tag BIG en linea: %d y columna: %d",linea, columna)}
"<big "{Atributo}*">"				{contar();printf("Encontro tag BIG en linea: %d y columna: %d",linea, columna)}
"</big>"					{contar();printf("Encontro tag BIG en linea: %d y columna: %d",linea, columna)}
"<blockquote>"					{contar();printf("Encontro tag BLOCKQUOTE en linea: %d y columna: %d",linea, columna)}
"<blockquote "{Atributo}*">"				{contar();printf("Encontro tag BLOCKQUOTE en linea: %d y columna: %d",linea, columna)}
"</blockquote>"					{contar();printf("Encontro tag BLOCKQUOTE en linea: %d y columna: %d",linea, columna)}
"<body>"					{contar();printf("Encontro tag BODY en linea: %d y columna: %d",linea, columna)}
"<body "{Atributo}*">"				{contar();printf("Encontro tag BODY en linea: %d y columna: %d",linea, columna)}
"</body>"					{contar();printf("Encontro tag BODY en linea: %d y columna: %d",linea, columna)}
"<br>"					{contar();printf("Encontro tag BR en linea: %d y columna: %d",linea, columna)}
"<br "{Atributo}*">"				{contar();printf("Encontro tag BR en linea: %d y columna: %d",linea, columna)}
"</br>"					{contar();printf("Encontro tag BR en linea: %d y columna: %d",linea, columna)}
"<button>"					{contar();printf("Encontro tag BUTTON en linea: %d y columna: %d",linea, columna)}
"<button "{Atributo}*">"				{contar();printf("Encontro tag BUTTON en linea: %d y columna: %d",linea, columna)}
"</button>"					{contar();printf("Encontro tag BUTTON en linea: %d y columna: %d",linea, columna)}
"<caption>"					{contar();printf("Encontro tag CAPTION en linea: %d y columna: %d",linea, columna)}
"<caption "{Atributo}*">"				{contar();printf("Encontro tag CAPTION en linea: %d y columna: %d",linea, columna)}
"</caption>"					{contar();printf("Encontro tag CAPTION en linea: %d y columna: %d",linea, columna)}
"<center>"					{contar();printf("Encontro tag CENTER en linea: %d y columna: %d",linea, columna)}
"<center "{Atributo}*">"				{contar();printf("Encontro tag CENTER en linea: %d y columna: %d",linea, columna)}
"</center>"					{contar();printf("Encontro tag CENTER en linea: %d y columna: %d",linea, columna)}
"<cite>"					{contar();printf("Encontro tag CITE en linea: %d y columna: %d",linea, columna)}
"<cite "{Atributo}*">"				{contar();printf("Encontro tag CITE en linea: %d y columna: %d",linea, columna)}
"</cite>"					{contar();printf("Encontro tag CITE en linea: %d y columna: %d",linea, columna)}
"<code>"					{contar();printf("Encontro tag CODE en linea: %d y columna: %d",linea, columna)}
"<code "{Atributo}*">"				{contar();printf("Encontro tag CODE en linea: %d y columna: %d",linea, columna)}
"</code>"					{contar();printf("Encontro tag CODE en linea: %d y columna: %d",linea, columna)}
"<col>"					{contar();printf("Encontro tag COL en linea: %d y columna: %d",linea, columna)}
"<col "{Atributo}*">"				{contar();printf("Encontro tag COL en linea: %d y columna: %d",linea, columna)}
"</col>"					{contar();printf("Encontro tag COL en linea: %d y columna: %d",linea, columna)}
"<colgroup>"					{contar();printf("Encontro tag COLGROUP en linea: %d y columna: %d",linea, columna)}
"<colgroup "{Atributo}*">"				{contar();printf("Encontro tag COLGROUP en linea: %d y columna: %d",linea, columna)}
"</colgroup>"					{contar();printf("Encontro tag COLGROUP en linea: %d y columna: %d",linea, columna)}
"<dd>"					{contar();printf("Encontro tag DD en linea: %d y columna: %d",linea, columna)}
"<dd "{Atributo}*">"				{contar();printf("Encontro tag DD en linea: %d y columna: %d",linea, columna)}
"</dd>"					{contar();printf("Encontro tag DD en linea: %d y columna: %d",linea, columna)}
"<del>"					{contar();printf("Encontro tag DEL en linea: %d y columna: %d",linea, columna)}
"<del "{Atributo}*">"				{contar();printf("Encontro tag DEL en linea: %d y columna: %d",linea, columna)}
"</del>"					{contar();printf("Encontro tag DEL en linea: %d y columna: %d",linea, columna)}
"<dir>"					{contar();printf("Encontro tag DIR en linea: %d y columna: %d",linea, columna)}
"<dir "{Atributo}*">"				{contar();printf("Encontro tag DIR en linea: %d y columna: %d",linea, columna)}
"</dir>"					{contar();printf("Encontro tag DIR en linea: %d y columna: %d",linea, columna)}
"<div>"					{contar();printf("Encontro tag DIV en linea: %d y columna: %d",linea, columna)}
"<div "{Atributo}*">"				{contar();printf("Encontro tag DIV en linea: %d y columna: %d",linea, columna)}
"</div>"					{contar();printf("Encontro tag DIV en linea: %d y columna: %d",linea, columna)}
"<dfn>"					{contar();printf("Encontro tag DFN en linea: %d y columna: %d",linea, columna)}
"<dfn "{Atributo}*">"				{contar();printf("Encontro tag DFN en linea: %d y columna: %d",linea, columna)}
"</dfn>"					{contar();printf("Encontro tag DFN en linea: %d y columna: %d",linea, columna)}
"<dl>"					{contar();printf("Encontro tag DL en linea: %d y columna: %d",linea, columna)}
"<dl "{Atributo}*">"				{contar();printf("Encontro tag DL en linea: %d y columna: %d",linea, columna)}
"</dl>"					{contar();printf("Encontro tag DL en linea: %d y columna: %d",linea, columna)}
"<dt>"					{contar();printf("Encontro tag DT en linea: %d y columna: %d",linea, columna)}
"<dt "{Atributo}*">"				{contar();printf("Encontro tag DT en linea: %d y columna: %d",linea, columna)}
"</dt>"					{contar();printf("Encontro tag DT en linea: %d y columna: %d",linea, columna)}
"<em>"					{contar();printf("Encontro tag EM en linea: %d y columna: %d",linea, columna)}
"<em "{Atributo}*">"				{contar();printf("Encontro tag EM en linea: %d y columna: %d",linea, columna)}
"</em>"					{contar();printf("Encontro tag EM en linea: %d y columna: %d",linea, columna)}
"<fieldset>"					{contar();printf("Encontro tag FIELDSET en linea: %d y columna: %d",linea, columna)}
"<fieldset "{Atributo}*">"				{contar();printf("Encontro tag FIELDSET en linea: %d y columna: %d",linea, columna)}
"</fieldset>"					{contar();printf("Encontro tag FIELDSET en linea: %d y columna: %d",linea, columna)}
"<font>"					{contar();printf("Encontro tag FONT en linea: %d y columna: %d",linea, columna)}
"<font "{Atributo}*">"				{contar();printf("Encontro tag FONT en linea: %d y columna: %d",linea, columna)}
"</font>"					{contar();printf("Encontro tag FONT en linea: %d y columna: %d",linea, columna)}
"<form>"					{contar();printf("Encontro tag FORM en linea: %d y columna: %d",linea, columna)}
"<form "{Atributo}*">"				{contar();printf("Encontro tag FORM en linea: %d y columna: %d",linea, columna)}
"</form>"					{contar();printf("Encontro tag FORM en linea: %d y columna: %d",linea, columna)}
"<frame>"					{contar();printf("Encontro tag FRAME en linea: %d y columna: %d",linea, columna)}
"<frame "{Atributo}*">"				{contar();printf("Encontro tag FRAME en linea: %d y columna: %d",linea, columna)}
"</frame>"					{contar();printf("Encontro tag FRAME en linea: %d y columna: %d",linea, columna)}
"<frameset>"					{contar();printf("Encontro tag FRAMESET en linea: %d y columna: %d",linea, columna)}
"<frameset "{Atributo}*">"				{contar();printf("Encontro tag FRAMESET en linea: %d y columna: %d",linea, columna)}
"</frameset>"					{contar();printf("Encontro tag FRAMESET en linea: %d y columna: %d",linea, columna)}
"<h1>"					{contar();printf("Encontro tag H1 en linea: %d y columna: %d",linea, columna)}
"<h1 "{Atributo}*">"				{contar();printf("Encontro tag H1 en linea: %d y columna: %d",linea, columna)}
"</h1>"					{contar();printf("Encontro tag H1 en linea: %d y columna: %d",linea, columna)}
"<h2>"					{contar();printf("Encontro tag H2 en linea: %d y columna: %d",linea, columna)}
"<h2 "{Atributo}*">"				{contar();printf("Encontro tag H2 en linea: %d y columna: %d",linea, columna)}
"</h2>"					{contar();printf("Encontro tag H2 en linea: %d y columna: %d",linea, columna)}
"<h3>"					{contar();printf("Encontro tag H3 en linea: %d y columna: %d",linea, columna)}
"<h3 "{Atributo}*">"				{contar();printf("Encontro tag H3 en linea: %d y columna: %d",linea, columna)}
"</h3>"					{contar();printf("Encontro tag H3 en linea: %d y columna: %d",linea, columna)}
"<h4>"					{contar();printf("Encontro tag H4 en linea: %d y columna: %d",linea, columna)}
"<h4 "{Atributo}*">"				{contar();printf("Encontro tag H4 en linea: %d y columna: %d",linea, columna)}
"</h4>"					{contar();printf("Encontro tag H4 en linea: %d y columna: %d",linea, columna)}
"<h5>"					{contar();printf("Encontro tag H5 en linea: %d y columna: %d",linea, columna)}
"<h5 "{Atributo}*">"				{contar();printf("Encontro tag H5 en linea: %d y columna: %d",linea, columna)}
"</h5>"					{contar();printf("Encontro tag H5 en linea: %d y columna: %d",linea, columna)}
"<h6>"					{contar();printf("Encontro tag H6 en linea: %d y columna: %d",linea, columna)}
"<h6 "{Atributo}*">"				{contar();printf("Encontro tag H6 en linea: %d y columna: %d",linea, columna)}
"</h6>"					{contar();printf("Encontro tag H6 en linea: %d y columna: %d",linea, columna)}
"<head>"					{contar();printf("Encontro tag HEAD en linea: %d y columna: %d",linea, columna)}
"<head "{Atributo}*">"				{contar();printf("Encontro tag HEAD en linea: %d y columna: %d",linea, columna)}
"</head>"					{contar();printf("Encontro tag HEAD en linea: %d y columna: %d",linea, columna)}
"<hr>"					{contar();printf("Encontro tag HR en linea: %d y columna: %d",linea, columna)}
"<hr "{Atributo}*">"				{contar();printf("Encontro tag HR en linea: %d y columna: %d",linea, columna)}
"</hr>"					{contar();printf("Encontro tag HR en linea: %d y columna: %d",linea, columna)}
"<html>"					{contar();printf("Encontro tag HTML en linea: %d y columna: %d",linea, columna)}
"<html "{Atributo}*">"				{contar();printf("Encontro tag HTML en linea: %d y columna: %d",linea, columna)}
"</html>"					{contar();printf("Encontro tag HTML en linea: %d y columna: %d",linea, columna)}
"<i>"					{contar();printf("Encontro tag I en linea: %d y columna: %d",linea, columna)}
"<i "{Atributo}*">"				{contar();printf("Encontro tag I en linea: %d y columna: %d",linea, columna)}
"</i>"					{contar();printf("Encontro tag I en linea: %d y columna: %d",linea, columna)}
"<iframe>"					{contar();printf("Encontro tag IFRAME en linea: %d y columna: %d",linea, columna)}
"<iframe "{Atributo}*">"				{contar();printf("Encontro tag IFRAME en linea: %d y columna: %d",linea, columna)}
"</iframe>"					{contar();printf("Encontro tag IFRAME en linea: %d y columna: %d",linea, columna)}
"<img>"					{contar();printf("Encontro tag IMG en linea: %d y columna: %d",linea, columna)}
"<img "{Atributo}*">"				{contar();printf("Encontro tag IMG en linea: %d y columna: %d",linea, columna)}
"</img>"					{contar();printf("Encontro tag IMG en linea: %d y columna: %d",linea, columna)}
"<input>"					{contar();printf("Encontro tag INPUT en linea: %d y columna: %d",linea, columna)}
"<input "{Atributo}*">"				{contar();printf("Encontro tag INPUT en linea: %d y columna: %d",linea, columna)}
"</input>"					{contar();printf("Encontro tag INPUT en linea: %d y columna: %d",linea, columna)}
"<ins>"					{contar();printf("Encontro tag INS en linea: %d y columna: %d",linea, columna)}
"<ins "{Atributo}*">"				{contar();printf("Encontro tag INS en linea: %d y columna: %d",linea, columna)}
"</ins>"					{contar();printf("Encontro tag INS en linea: %d y columna: %d",linea, columna)}
"<isindex>"					{contar();printf("Encontro tag ISINDEX en linea: %d y columna: %d",linea, columna)}
"<isindex "{Atributo}*">"				{contar();printf("Encontro tag ISINDEX en linea: %d y columna: %d",linea, columna)}
"</isindex>"					{contar();printf("Encontro tag ISINDEX en linea: %d y columna: %d",linea, columna)}
"<kbd>"					{contar();printf("Encontro tag KBD en linea: %d y columna: %d",linea, columna)}
"<kbd "{Atributo}*">"				{contar();printf("Encontro tag KBD en linea: %d y columna: %d",linea, columna)}
"</kbd>"					{contar();printf("Encontro tag KBD en linea: %d y columna: %d",linea, columna)}
"<label>"					{contar();printf("Encontro tag LABEL en linea: %d y columna: %d",linea, columna)}
"<label "{Atributo}*">"				{contar();printf("Encontro tag LABEL en linea: %d y columna: %d",linea, columna)}
"</label>"					{contar();printf("Encontro tag LABEL en linea: %d y columna: %d",linea, columna)}
"<legend>"					{contar();printf("Encontro tag LEGEND en linea: %d y columna: %d",linea, columna)}
"<legend "{Atributo}*">"				{contar();printf("Encontro tag LEGEND en linea: %d y columna: %d",linea, columna)}
"</legend>"					{contar();printf("Encontro tag LEGEND en linea: %d y columna: %d",linea, columna)}
"<li>"					{contar();printf("Encontro tag LI en linea: %d y columna: %d",linea, columna)}
"<li "{Atributo}*">"				{contar();printf("Encontro tag LI en linea: %d y columna: %d",linea, columna)}
"</li>"					{contar();printf("Encontro tag LI en linea: %d y columna: %d",linea, columna)}
"<link>"					{contar();printf("Encontro tag LINK en linea: %d y columna: %d",linea, columna)}
"<link "{Atributo}*">"				{contar();printf("Encontro tag LINK en linea: %d y columna: %d",linea, columna)}
"</link>"					{contar();printf("Encontro tag LINK en linea: %d y columna: %d",linea, columna)}
"<map>"					{contar();printf("Encontro tag MAP en linea: %d y columna: %d",linea, columna)}
"<map "{Atributo}*">"				{contar();printf("Encontro tag MAP en linea: %d y columna: %d",linea, columna)}
"</map>"					{contar();printf("Encontro tag MAP en linea: %d y columna: %d",linea, columna)}
"<menu>"					{contar();printf("Encontro tag MENU en linea: %d y columna: %d",linea, columna)}
"<menu "{Atributo}*">"				{contar();printf("Encontro tag MENU en linea: %d y columna: %d",linea, columna)}
"</menu>"					{contar();printf("Encontro tag MENU en linea: %d y columna: %d",linea, columna)}
"<meta>"					{contar();printf("Encontro tag META en linea: %d y columna: %d",linea, columna)}
"<meta "{Atributo}*">"				{contar();printf("Encontro tag META en linea: %d y columna: %d",linea, columna)}
"</meta>"					{contar();printf("Encontro tag META en linea: %d y columna: %d",linea, columna)}
"<noframes>"					{contar();printf("Encontro tag NOFRAMES en linea: %d y columna: %d",linea, columna)}
"<noframes "{Atributo}*">"				{contar();printf("Encontro tag NOFRAMES en linea: %d y columna: %d",linea, columna)}
"</noframes>"					{contar();printf("Encontro tag NOFRAMES en linea: %d y columna: %d",linea, columna)}
"<noscript>"					{contar();printf("Encontro tag NOSCRIPT en linea: %d y columna: %d",linea, columna)}
"<noscript "{Atributo}*">"				{contar();printf("Encontro tag NOSCRIPT en linea: %d y columna: %d",linea, columna)}
"</noscript>"					{contar();printf("Encontro tag NOSCRIPT en linea: %d y columna: %d",linea, columna)}
"<object>"					{contar();printf("Encontro tag OBJECT en linea: %d y columna: %d",linea, columna)}
"<object "{Atributo}*">"				{contar();printf("Encontro tag OBJECT en linea: %d y columna: %d",linea, columna)}
"</object>"					{contar();printf("Encontro tag OBJECT en linea: %d y columna: %d",linea, columna)}
"<ol>"					{contar();printf("Encontro tag OL en linea: %d y columna: %d",linea, columna)}
"<ol "{Atributo}*">"				{contar();printf("Encontro tag OL en linea: %d y columna: %d",linea, columna)}
"</ol>"					{contar();printf("Encontro tag OL en linea: %d y columna: %d",linea, columna)}
"<optgroup>"					{contar();printf("Encontro tag OPTGROUP en linea: %d y columna: %d",linea, columna)}
"<optgroup "{Atributo}*">"				{contar();printf("Encontro tag OPTGROUP en linea: %d y columna: %d",linea, columna)}
"</optgroup>"					{contar();printf("Encontro tag OPTGROUP en linea: %d y columna: %d",linea, columna)}
"<option>"					{contar();printf("Encontro tag OPTION en linea: %d y columna: %d",linea, columna)}
"<option "{Atributo}*">"				{contar();printf("Encontro tag OPTION en linea: %d y columna: %d",linea, columna)}
"</option>"					{contar();printf("Encontro tag OPTION en linea: %d y columna: %d",linea, columna)}
"<p>"					{contar();printf("Encontro tag P en linea: %d y columna: %d",linea, columna)}
"<p "{Atributo}*">"				{contar();printf("Encontro tag P en linea: %d y columna: %d",linea, columna)}
"</p>"					{contar();printf("Encontro tag P en linea: %d y columna: %d",linea, columna)}
"<param>"					{contar();printf("Encontro tag PARAM en linea: %d y columna: %d",linea, columna)}
"<param "{Atributo}*">"				{contar();printf("Encontro tag PARAM en linea: %d y columna: %d",linea, columna)}
"</param>"					{contar();printf("Encontro tag PARAM en linea: %d y columna: %d",linea, columna)}
"<pre>"					{contar();printf("Encontro tag PRE en linea: %d y columna: %d",linea, columna)}
"<pre "{Atributo}*">"				{contar();printf("Encontro tag PRE en linea: %d y columna: %d",linea, columna)}
"</pre>"					{contar();printf("Encontro tag PRE en linea: %d y columna: %d",linea, columna)}
"<q>"					{contar();printf("Encontro tag Q en linea: %d y columna: %d",linea, columna)}
"<q "{Atributo}*">"				{contar();printf("Encontro tag Q en linea: %d y columna: %d",linea, columna)}
"</q>"					{contar();printf("Encontro tag Q en linea: %d y columna: %d",linea, columna)}
"<s>"					{contar();printf("Encontro tag S en linea: %d y columna: %d",linea, columna)}
"<s "{Atributo}*">"				{contar();printf("Encontro tag S en linea: %d y columna: %d",linea, columna)}
"</s>"					{contar();printf("Encontro tag S en linea: %d y columna: %d",linea, columna)}
"<samp>"					{contar();printf("Encontro tag SAMP en linea: %d y columna: %d",linea, columna)}
"<samp "{Atributo}*">"				{contar();printf("Encontro tag SAMP en linea: %d y columna: %d",linea, columna)}
"</samp>"					{contar();printf("Encontro tag SAMP en linea: %d y columna: %d",linea, columna)}
"<script>"					{contar();printf("Encontro tag SCRIPT en linea: %d y columna: %d",linea, columna)}
"<script "{Atributo}*">"				{contar();printf("Encontro tag SCRIPT en linea: %d y columna: %d",linea, columna)}
"</script>"					{contar();printf("Encontro tag SCRIPT en linea: %d y columna: %d",linea, columna)}
"<select>"					{contar();printf("Encontro tag SELECT en linea: %d y columna: %d",linea, columna)}
"<select "{Atributo}*">"				{contar();printf("Encontro tag SELECT en linea: %d y columna: %d",linea, columna)}
"</select>"					{contar();printf("Encontro tag SELECT en linea: %d y columna: %d",linea, columna)}
"<small>"					{contar();printf("Encontro tag SMALL en linea: %d y columna: %d",linea, columna)}
"<small "{Atributo}*">"				{contar();printf("Encontro tag SMALL en linea: %d y columna: %d",linea, columna)}
"</small>"					{contar();printf("Encontro tag SMALL en linea: %d y columna: %d",linea, columna)}
"<span>"					{contar();printf("Encontro tag SPAN en linea: %d y columna: %d",linea, columna)}
"<span "{Atributo}*">"				{contar();printf("Encontro tag SPAN en linea: %d y columna: %d",linea, columna)}
"</span>"					{contar();printf("Encontro tag SPAN en linea: %d y columna: %d",linea, columna)}
"<strike>"					{contar();printf("Encontro tag STRIKE en linea: %d y columna: %d",linea, columna)}
"<strike "{Atributo}*">"				{contar();printf("Encontro tag STRIKE en linea: %d y columna: %d",linea, columna)}
"</strike>"					{contar();printf("Encontro tag STRIKE en linea: %d y columna: %d",linea, columna)}
"<strong>"					{contar();printf("Encontro tag STRONG en linea: %d y columna: %d",linea, columna)}
"<strong "{Atributo}*">"				{contar();printf("Encontro tag STRONG en linea: %d y columna: %d",linea, columna)}
"</strong>"					{contar();printf("Encontro tag STRONG en linea: %d y columna: %d",linea, columna)}
"<style>"					{contar();printf("Encontro tag STYLE en linea: %d y columna: %d",linea, columna)}
"<style "{Atributo}*">"				{contar();printf("Encontro tag STYLE en linea: %d y columna: %d",linea, columna)}
"</style>"					{contar();printf("Encontro tag STYLE en linea: %d y columna: %d",linea, columna)}
"<sub>"					{contar();printf("Encontro tag SUB en linea: %d y columna: %d",linea, columna)}
"<sub "{Atributo}*">"				{contar();printf("Encontro tag SUB en linea: %d y columna: %d",linea, columna)}
"</sub>"					{contar();printf("Encontro tag SUB en linea: %d y columna: %d",linea, columna)}
"<sup>"					{contar();printf("Encontro tag SUP en linea: %d y columna: %d",linea, columna)}
"<sup "{Atributo}*">"				{contar();printf("Encontro tag SUP en linea: %d y columna: %d",linea, columna)}
"</sup>"					{contar();printf("Encontro tag SUP en linea: %d y columna: %d",linea, columna)}
"<table>"					{contar();printf("Encontro tag TABLE en linea: %d y columna: %d",linea, columna)}
"<table "{Atributo}*">"				{contar();printf("Encontro tag TABLE en linea: %d y columna: %d",linea, columna)}
"</table>"					{contar();printf("Encontro tag TABLE en linea: %d y columna: %d",linea, columna)}
"<tbody>"					{contar();printf("Encontro tag TBODY en linea: %d y columna: %d",linea, columna)}
"<tbody "{Atributo}*">"				{contar();printf("Encontro tag TBODY en linea: %d y columna: %d",linea, columna)}
"</tbody>"					{contar();printf("Encontro tag TBODY en linea: %d y columna: %d",linea, columna)}
"<td>"					{contar();printf("Encontro tag TD en linea: %d y columna: %d",linea, columna)}
"<td "{Atributo}*">"				{contar();printf("Encontro tag TD en linea: %d y columna: %d",linea, columna)}
"</td>"					{contar();printf("Encontro tag TD en linea: %d y columna: %d",linea, columna)}
"<textarea>"					{contar();printf("Encontro tag TEXTAREA en linea: %d y columna: %d",linea, columna)}
"<textarea "{Atributo}*">"				{contar();printf("Encontro tag TEXTAREA en linea: %d y columna: %d",linea, columna)}
"</textarea>"					{contar();printf("Encontro tag TEXTAREA en linea: %d y columna: %d",linea, columna)}
"<tfoot>"					{contar();printf("Encontro tag TFOOT en linea: %d y columna: %d",linea, columna)}
"<tfoot "{Atributo}*">"				{contar();printf("Encontro tag TFOOT en linea: %d y columna: %d",linea, columna)}
"</tfoot>"					{contar();printf("Encontro tag TFOOT en linea: %d y columna: %d",linea, columna)}
"<th>"					{contar();printf("Encontro tag TH en linea: %d y columna: %d",linea, columna)}
"<th "{Atributo}*">"				{contar();printf("Encontro tag TH en linea: %d y columna: %d",linea, columna)}
"</th>"					{contar();printf("Encontro tag TH en linea: %d y columna: %d",linea, columna)}
"<thead>"					{contar();printf("Encontro tag THEAD en linea: %d y columna: %d",linea, columna)}
"<thead "{Atributo}*">"				{contar();printf("Encontro tag THEAD en linea: %d y columna: %d",linea, columna)}
"</thead>"					{contar();printf("Encontro tag THEAD en linea: %d y columna: %d",linea, columna)}
"<title>"					{contar();printf("Encontro tag TITLE en linea: %d y columna: %d",linea, columna)}
"<title "{Atributo}*">"				{contar();printf("Encontro tag TITLE en linea: %d y columna: %d",linea, columna)}
"</title>"					{contar();printf("Encontro tag TITLE en linea: %d y columna: %d",linea, columna)}
"<tr>"					{contar();printf("Encontro tag TR en linea: %d y columna: %d",linea, columna)}
"<tr "{Atributo}*">"				{contar();printf("Encontro tag TR en linea: %d y columna: %d",linea, columna)}
"</tr>"					{contar();printf("Encontro tag TR en linea: %d y columna: %d",linea, columna)}
"<tt>"					{contar();printf("Encontro tag TT en linea: %d y columna: %d",linea, columna)}
"<tt "{Atributo}*">"				{contar();printf("Encontro tag TT en linea: %d y columna: %d",linea, columna)}
"</tt>"					{contar();printf("Encontro tag TT en linea: %d y columna: %d",linea, columna)}
"<u>"					{contar();printf("Encontro tag U en linea: %d y columna: %d",linea, columna)}
"<u "{Atributo}*">"				{contar();printf("Encontro tag U en linea: %d y columna: %d",linea, columna)}
"</u>"					{contar();printf("Encontro tag U en linea: %d y columna: %d",linea, columna)}
"<ul>"					{contar();printf("Encontro tag UL en linea: %d y columna: %d",linea, columna)}
"<ul "{Atributo}*">"				{contar();printf("Encontro tag UL en linea: %d y columna: %d",linea, columna)}
"</ul>"					{contar();printf("Encontro tag UL en linea: %d y columna: %d",linea, columna)}
"<var>"					{contar();printf("Encontro tag VAR en linea: %d y columna: %d",linea, columna)}
"<var "{Atributo}*">"				{contar();printf("Encontro tag VAR en linea: %d y columna: %d",linea, columna)}
"</var>"					{contar();printf("Encontro tag VAR en linea: %d y columna: %d",linea, columna)}


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
