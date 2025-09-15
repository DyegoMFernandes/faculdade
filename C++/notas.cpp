typedef struct{
	int topo;
	int dados[maxtam];
}tipopilha;

tipopilha p1,pilha;


decimal - binario
10/2 = 5 resto(0), 5/2 = 2 resto(1), 2/2 = 1 resto(0), 1/2 = resto(1) (usar %2) - resto = n%2 push(resto) -> empilhamento final -> 0101