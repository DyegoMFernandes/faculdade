#include <iostream>
using namespace std;


int topo1, topo2;
const int tamMax = 20;
int pilha1[tamMax], pilha2[tamMax]; // declarar pilha1 e pilha2 globalmente


void inicializar() {
    topo1 = -1;
    topo2 = -1;
}

bool Push(int valor, int opc) {
    if (opc == 1) {
        if (topo1 == tamMax - 1) return false; // Pilha1 cheia
        pilha1[++topo1] = valor;
        return true;
    } else {
        if (topo2 == tamMax - 1) return false; // Pilha2 cheia
        pilha2[++topo2] = valor;
        return true;
    }
}

bool comparar(int p1[], int t1, int p2[], int t2) {
    if (t1 != t2) return false;

    for (int i = 0; i <= t1; i++) {
        if (p1[i] != p2[i]) {
            return false;
        }
    }
    return true;
}

void exibir(int p[], int topo, string nome) {
    cout << nome << ": ";
    if (topo == -1) {
        cout << "(vazia)";
    } else {
        for (int i = 0; i <= topo; i++) {
            cout << p[i] << " ";
        }
    }
    cout << endl;
}

int main() {
    int opcao, opc, valor;
    inicializar();

    do {
        cout << "\n===== MENU =====" << endl;
        cout << "1 - Empilhar Pilha1" << endl;
        cout << "2 - Empilhar Pilha2" << endl;
        cout << "3 - Comparar Pilhas" << endl;
        cout << "4 - Exibir Pilhas" << endl;
        cout << "0 - Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Digite um valor para empilhar na Pilha1: ";
                cin >> valor;
                if (Push(valor, 1))
                    cout << "Valor empilhado com sucesso!" << endl;
                else
                    cout << "Erro: Pilha1 cheia!" << endl;
                break;

            case 2:
                cout << "Digite um valor para empilhar na Pilha2: ";
                cin >> valor;
                if (Push(valor, 2))
                    cout << "Valor empilhado com sucesso!" << endl;
                else
                    cout << "Erro: Pilha2 cheia!" << endl;
                break;

            case 3:
                if (comparar(pilha1, topo1, pilha2, topo2)) {
                    cout << "As pilhas sao iguais!" << endl;
                } else {
                    cout << "As pilhas sao diferentes!" << endl;
                }
                break;

            case 4:
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
