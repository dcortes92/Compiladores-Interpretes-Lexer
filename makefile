analizador: analizador2.l
	flex analizador.l
	gcc -o analizador lex.yy.c -lfl
