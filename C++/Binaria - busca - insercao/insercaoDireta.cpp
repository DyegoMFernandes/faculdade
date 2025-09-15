#include <iostream>
#include <locale.h>
using namespace std;

int main() {
    setlocale(LC_ALL, "Portuguese");
	    int vet[10], i, posicaoAnterior, atual;

    // Lendo os elementos
    cout << "Digite 10 elementos:" << endl;
    for (i = 0; i < 10; i++) {
        cin >> vet[i];
    }

	// for pra percorer o array a ser criado (inicializa em 1 pois se fosse em 0, não teria valor anterior pra ser comparado)
	for (i = 1; i < 10; i++) {
		// Recebe o valor a ser posicionado no array
		atual = vet[i];
		// Pega a posição do valor anterior do valor acima ( que foi guardado pra ser posicionado)
		posicaoAnterior = i -1;
		// enquanto posicao for valida (>=0) e o valor dentro do vetor base na posição que esta sendo comparada for maior que o valor atual a ser ordenado 
		while(posicaoAnterior >= 0 && vet[posicaoAnterior] > atual){
			// Faça com que o vetor receba o valor que está sendo comparado na posição anterior na celula de posição +1, deixando [3,2] como [3,3]
			vet[posicaoAnterior + 1] = vet[posicaoAnterior];
			// Diminui o valor de posição anterior para continuar a comparação com os outros valores da mesma forma
			posicaoAnterior--;
		}
    	// Depois que sair do loop, ele vê qual a posicao em que parou o loop, adiciona +1 pra se referir a posicao atual que deve ser alterada, e insere o valor em questão
	    vet[posicaoAnterior + 1] = atual;
    }
    
    // Exibindo os valores ordenados
    cout << "Valores ordenados: ";
    for (i = 0; i < 10; i++) {
        cout << vet[i] << " ";
    }
    cout << endl;

}