#include <iostream>
#include <locale.h>
using namespace std;

int main() {
    setlocale(LC_ALL, "Portuguese");

    int inicio, fim, vet[10], i, achou, n, pos;

    // Lendo os elementos (IMPORTANTE: devem estar ordenados!)
    cout << "Digite 10 elementos em ordem crescente:" << endl;
    for (i = 0; i < 10; i++) {
        cin >> vet[i];
    }

    cout << "Informe o número N a ser buscado: ";
    cin >> n;

    achou = 0;
    inicio = 0;
    fim = 9;

    while ((inicio <= fim) && (achou == 0)) {
        pos = (inicio + fim) / 2; // calcula a posição do meio

        if (n == vet[pos]) {
            achou = 1;
        }
        else if (n < vet[pos]) {
            fim = pos - 1;
        }
        else {
            inicio = pos + 1;
        }
    }

    if (achou == 0) {
        cout << "N nao encontrado" << endl;
    }
    else {
        cout << "N encontrado na posicao: " << pos << endl;
    }

    return 0;
}
