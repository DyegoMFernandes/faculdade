#include <iostream>
using namespace std;

int topo1, topo2;
const int tamMax = 20;
int pilha1[tamMax], pilha2[tamMax]; // duas pilhas globais

void inicializar() {
    topo1 = -1;
    topo2 = -1;
}

bool Push(int valor) {
    if (topo1 == tamMax - 1) return false; // Pilha1 cheia
    pilha1[++topo1] = valor;
    return true;
}

void copiar(int p1[], int topo1, int p2[], int &topo2) {
    topo2 = topo1; // copia tamanho
    for (int i = 0; i <= topo1; i++) {
        p2[i] = p1[i]; // copia cada elemento
    }
}

void exibir(int pilhaExibida[], int topo, string nome) {
    cout << nome << ": ";
    if (topo == -1) {
        cout << "(vazia)";
    } else {
        for (int i = 0; i <= topo; i++) {
            cout << pilhaExibida[i] << " ";
        }
    }
    cout << endl;
}

int main() {
    int opcao, valor;
    inicializar();

    do {
        cout << "\n===== MENU =====" << endl;
        cout << "1 - Empilhar Pilha1" << endl;
        cout << "2 - Copiar Pilha1 para Pilha2" << endl;
        cout << "3 - Exibir Pilhas" << endl;
        cout << "0 - Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Digite um valor para empilhar na Pilha1: ";
                cin >> valor;
                if (Push(valor))
                    cout << "Valor empilhado com sucesso!" << endl;
                else
                    cout << "Erro: Pilha1 cheia!" << endl;
                break;

            case 2:
                copiar(pilha1, topo1, pilha2, topo2);
                cout << "Pilha1 copiada para Pilha2 com sucesso!" << endl;
                break;

            case 3:
                exibir(pilha1, topo1, "Pilha1");
                exibir(pilha2, topo2, "Pilha2");
                break;

            case 0:
                cout << "Saindo do programa..." << endl;
                break;

            default:
                cout << "Opcao invalida!" << endl;
        }
    } while (opcao != 0);

    return 0;
}
