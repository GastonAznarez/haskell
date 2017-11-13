#include <stdio.h>

void intercambiar(int a[], int tam, int i, int j){
	int aux;
	aux = a[i];
	a[i] = a[j];
	a[j] = aux;
}


int main (){
 	int y,z,N;
    printf("Inserte el la posicion del primer numero que desea cambiar: ");
    scanf("%d\n",z);

    printf("Inserte el la posicion del segundo numero que desea cambiar: ");
    scanf("%d\n",y);


    printf("\nCuantos elementos va a tener el arreglo? ");
    scanf ("%d\n",N);

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
    
    int b[N];
    b[N] = intercambiar (a[],N,z,y);

    printf("\nEl arreglo quedaria: ");
     i = 0;
    while (i < N) {
	printf("%d ", b[i]);
	i++;

return 0;
}
