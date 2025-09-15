#include <iostream>
using namespace std;

// Variáveis globais
const int maxTam = 10;
int topo, pilha[maxTam];

void inicializar() {
    topo = -1;
}

bool PilhaVazia() {
    return (topo == -1);
}

bool PilhaCheia() {
    return (topo == maxTam - 1);
}

bool Push(int valor) {
    if (PilhaCheia()) {
        return false;
    } else {
        topo++;
        pilha[topo] = valor;
        return true;
    }
}
// o uso do & (E comercial) faz a referencia da memoria pra que o valor possa ser jogado pra fora da função(diretamente no endereço)
// sem a necessidade de um return exclusivo pra ela. Coisa que não seria possivel nessa função pois ela foi definida como booleana

void ConsultaBinario(int valor) {
    while (valor > 0){
		int aux = valor % 2;
		valor = valor / 2;
		Push(aux);
	}
		cout<< "Valor em binario: ";
    for (int i = topo; i >= 0; i--){
        cout<<pilha[i];
	}
	
}


int main() {
    int valor;
    inicializar();
    
    cout << "Digite um valor para converter e empilhar: ";
   	cin >> valor;
	ConsultaBinario(valor);
    return 0;
}
