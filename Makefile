start-project:
	rm -rf lex.yy.cc a.out result.txt
	lex hello-world.l
	gcc lex.yy.c
	./a.out 