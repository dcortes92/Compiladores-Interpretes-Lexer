analizador: analizador2.l
	flex analizador2.l
	gcc -o analizador lex.yy.c -lfl
