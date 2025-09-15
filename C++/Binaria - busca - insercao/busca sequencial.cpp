#include <iostream>
#include <locale.h>
using namespace std;

int main() {
    setlocale(LC_ALL, "Portuguese");

    int vet[5], i, pos, n = 12, procurado;
    for(i = 0; i < 5; i++) {
        cout << "Informe os elementos: ";
        cin >> vet[i];
    }

    i = 0;
    procurado = 0;

    while ((i < 5) && (procurado == 0)) {
        if (n == vet[i]) {
            procurado = 1;
            pos = i;
        } else {
            i++;
        }
    }

    if (procurado == 0) {
        cout << "N não encontrado" << endl;
    } else {
        cout << "N encontrado na posição: " << pos << endl;
    }

    return 0;
}
