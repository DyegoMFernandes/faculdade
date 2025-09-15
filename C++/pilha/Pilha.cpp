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
bool Pop(int &valor) {
    if (PilhaVazia()) {
        return false;
    } else {
        valor = pilha[topo];
        topo--;
        return true;
    }
}

int ConsultaTopo(int &valor) {
    if (PilhaVazia()) {
        return false;
    } else {
        valor = pilha[topo];
        return true;
    }
}

int TamanhoPilha() {
    return topo + 1;
}

int main() {
    int opcao, valor;
    inicializar();

    do {
        cout << "\n===== MENU =====" << endl;
        cout << "1 - Empilhar" << endl;
        cout << "2 - Desempilhar" << endl;
        cout << "3 - Consultar Topo" << endl;
        cout << "4 - Tamanho da Pilha" << endl;
        cout << "0 - Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Digite um valor para empilhar: ";
                cin >> valor;
                if (Push(valor))
                    cout << "Valor empilhado com sucesso!" << endl;
                else
                    cout << "Erro: Pilha cheia!" << endl;
                break;

            case 2:
                if (Pop(valor))
                    cout << "Valor desempilhado: " << valor << endl;
                else
                    cout << "Erro: Pilha vazia!" << endl;
                break;

            case 3:
                if (ConsultaTopo(valor))
                    cout << "Valor no topo: " << valor << endl;
                else
                    cout << "Erro: Pilha vazia!" << endl;
                break;

            case 4:
                cout << "Tamanho da pilha: " << TamanhoPilha() << endl;
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
