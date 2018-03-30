# Marcos Cesar Ribeiro de Camargo - 9278045 - Turma 1
# Victor Luiz Roquete Forbes - 9293394 - Turma 1
# Lucas de Oliveira Pacheco - 9293182 - Turma 1
# Gabriel Pinto de Camargo - 9293456 - Turma 1
# Guilherme Hideo Tubone - 9019403 - Turma 1

all:
	@lex gcc-.l 
	@gcc lex.yy.c -o gcc- -ll
	@rm lex.yy.c
test1:
	@./gcc- cases/soma_correct.c-
test2:
	@./gcc- cases/soma_incorrect.c-	