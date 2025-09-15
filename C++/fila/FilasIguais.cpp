#include <iostream>
using namespace std;

const int maxTam = 10;
int topo, pilha[maxTam]; 

typedef struct {
    int frente, tras;
    int dados[maxTam];
} tipo_fila;

tipo_fila f1,f2;

void inicializar(tipo_fila &fila) {
    fila.frente = 0;
    fila.tras = -1;
}

bool FilaVazia(tipo_fila &fila) {
    return (fila.frente > fila.tras);
}

bool FilaCheia(tipo_fila &fila) {
    return (fila.tras == maxTam - 1);
}

bool enfileirar(tipo_fila &fila, int valor) {
    if (FilaCheia(fila)) {
        return false;
    } else {
        fila.tras++;
        fila.dados[fila.tras] = valor;
        return true;
    }
}

bool PilhaVazia() {
    return (topo == -1);
}

void exibir(tipo_fila &fila, tipo_fila &fila2) {
    cout << "Fila 1: ";
    if (FilaVazia(fila)) {
        cout << "Vazia";
    } else {
        for (int i = fila.frente; i <= fila.tras; i++) {
            cout << fila.dados[i] << " ";
        }
    }
    
    cout << "Fila 2: ";
    if (FilaVazia(fila2)) {
	    cout << "Vazia";
	}	else{
	        for (int i = fila2.frente; i <= fila2.tras; i++) {
	            cout << fila2.dados[i] << " ";
	        }
	    }
    cout << endl;
}
    


bool comparar(tipo_fila &fila, tipo_fila &fila2) {
    if (fila.frente != fila2.tras){
		return false;
	} 

    for (int i = 0; i <= fila.tras; i++) {
        if (fila.dados[i] != fila2.dados[i]) {
            return false;
        }
    }
    
    return true;
}

int main() {
    int opcao, valor;
    inicializar(f1);
    inicializar(f2);

    do {
        cout << "\n===== MENU =====" << endl;
        cout << "1 - Enfileirar fila 1" << endl;
        cout << "2 - Enfileirar fila 2" << endl;
        cout << "3 - Exibir" << endl;
        cout << "4 - Comparar filas" << endl;
        cout << "0 - Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
            	system("cls");
                cout << "Digite um valor para Enfileirar: ";
                cin >> valor;
                if (enfileirar(f1, valor))
                    cout << "Valor Enfileirado com sucesso!" << endl;
                else
                    cout << "Erro: Fila cheia!" << endl;
                break;

            case 2:
            	system("cls");
                cout << "Digite um valor para Enfileirar: ";
                cin >> valor;
                if (enfileirar(f2, valor)){
                	
                    cout << "Valor Enfileirado com sucesso!" << endl;
				}
                else{
                	
                    cout << "Erro: Fila cheia!" << endl;
				}
				break;
            case 3:
				system("cls");
                exibir(f1,f2);
                break;
            
            case 4:
                if (comparar(f1, f2)) {
                    cout << "As filas sao iguais!" << endl;
                } else {
                    cout << "As filas sao diferentes!" << endl;
                }
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
