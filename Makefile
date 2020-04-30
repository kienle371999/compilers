start-project:
	rm -rf lex.yy.cc a.out
	lex hello-world.l
	gcc lex.yy.c
	./a.out 