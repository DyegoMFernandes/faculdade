#include <iostream>
using namespace std;

const int maxTam = 10;
int topo, pilha[maxTam]; 

typedef struct {
    int frente, tras;
    int dados[maxTam];
} tipo_fila;

tipo_fila f1;

void inicializar(tipo_fila &fila) {
    fila.frente = 0;
    fila.tras = -1;
    topo = -1; 
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

bool desenfileirar(tipo_fila &fila, int &valor) {
    if (FilaVazia(fila)) {
        return false;
    } else {
        valor = fila.dados[fila.frente];
        fila.frente++;
        return true;
    }
}

bool PilhaVazia() {
    return (topo == -1);
}

void exibir(tipo_fila &fila) {
    cout << "Fila: ";
    if (FilaVazia(fila)) {
        cout << "Vazia";
    } else {
        for (int i = fila.frente; i <= fila.tras; i++) {
            cout << fila.dados[i] << " ";
        }
    }
    cout << endl;
    
    cout << "Pilha: ";
    if (PilhaVazia()) {
        cout << "Vazia";
    } else {
        for (int i = 0; i <= topo; i++) {
            cout << pilha[i] << " ";
        }
    }
    cout << endl;
}

bool PilhaCheia() {
    return (topo == maxTam - 1);
}

bool push(int valor) {
    if (PilhaCheia()){
    	return false;
	}else{
	    topo++;
	    pilha[topo] = valor;
	    return true;
	}
}

int main() {
    int opcao, valor;
    inicializar(f1);

    do {
        cout << "\n===== MENU =====" << endl;
        cout << "1 - Enfileirar" << endl;
        cout << "2 - Desenfileirar pra pilha" << endl;
        cout << "3 - Exibir" << endl;
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
            	if(FilaVazia(f1)){
            		cout << "Erro: Fila vazia!" << endl;
				}else{
	            	while(!FilaVazia(f1)){
		                if (desenfileirar(f1, valor)) {
		                    if (push(valor)){
	                    	cout << "Valor " << valor << " transferido da fila para a pilha." << endl;
							}
						}
		                else{
		                    cout << "Erro: Pilha cheia!" << endl;
		                    break;
						}
		            }
				}
		            cout << "Valores Empilhados com sucesso!" << endl;
				
				break;
            case 3:
				system("cls");
                exibir(f1);
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
