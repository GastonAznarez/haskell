#include <stdio.h>
#define N 5

// Programa con bugs!

// Devuelve la cantidad de elementos pares en un arreglo:
int cantidad_de_pares(int a[], int size) {
    int i = 0; //Estaba en i, e i no estaba definido (un numero negativo en memoria, creo que el menor valor de un int)
    int cantidad = 0;
    while (i < N) { //Esto erra <= N, pedia a a[] un elemento que no tenia
    	if (a[i] % 2 == 0) {
    	    cantidad = cantidad + 1;
    	}
      i = i + 1; //Esto estaba adentro del if, el ciclo no terminaba si no eran todos pares
    }
    return cantidad;
}

int main() {
    int a[N];
    int i = 0;
    while (i < N) {
	printf("Inserte el elemento de la posición %d del arreglo: ", i);
	scanf("%d", &a[i]);
	i++;
    }
    printf("Usted insertó el siguiente arreglo: ");
    i = 0;
    while (i < N) {
	printf("%d ", a[i]);
	i++;
    }
    printf("\n La cantidad de números pares del arreglo es %d \n",
	   cantidad_de_pares(a, N + 1)); //El + 1 esta de mas, en todo caso, N o N - 1
    return 0;
}
