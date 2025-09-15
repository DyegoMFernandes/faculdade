#include <iostream>
using namespace std;

// Variáveis globais
const int maxTam = 10;
int frente, tras, fila[maxTam];

void inicializar() {
    frente = 0;
    tras = -1;
}

bool FilaVazia() {
    return (frente > tras);
}

bool FilaCheia() {
    return (tras == maxTam - 1);
}

bool enfileirar(int valor) {
    if (FilaCheia()) {
        return false;
    } else {
        tras++;
        fila[tras] = valor;
        return true;
    }
}

bool desenfileirar(int &valor) {
    if (FilaVazia()) {
        return false;
    } else {
        valor = fila[frente];
        frente++;
        return true;
    }
}

bool filaGet(int &valor) {
    if (FilaVazia()) {
        return false;
    } else {
        valor = fila[frente];
        return true;
    }
}

int TamanhoFila() {
    if (FilaVazia()) return 0;
    return (tras - frente + 1);
}

int main() {
    int opcao, valor;
    inicializar();

    do {
        cout << "\n===== MENU =====" << endl;
        cout << "1 - Enfileirar" << endl;
        cout << "2 - Desenfileirar" << endl;
        cout << "3 - Consultar frente" << endl;
        cout << "4 - Tamanho da Fila" << endl;
        cout << "0 - Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Digite um valor para Enfileirar: ";
                cin >> valor;
                if (enfileirar(valor))
                    cout << "Valor Enfileirado com sucesso!" << endl;
                else
                    cout << "Erro: Fila cheia!" << endl;
                break;

            case 2:
                if (desenfileirar(valor))
                    cout << "Valor Desenfileirado: " << valor << endl;
                else
                    cout << "Erro: Fila vazia!" << endl;
                break;

            case 3:
                if (filaGet(valor))
                    cout << "Valor na frente: " << valor << endl;
                else
                    cout << "Erro: fila vazia!" << endl;
                break;

            case 4:
                cout << "Tamanho da fila: " << TamanhoFila() << endl;
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
