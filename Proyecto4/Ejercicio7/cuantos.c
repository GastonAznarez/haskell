#include <stdio.h>
#define N 5



struct comp_t cuantos(int a[], int tam, int elem){
	int m = 0;
	int M = 0;
	int I = 0;
	for (int i = 0; i < tam; ++i)
	{
		if (a[i] < elem) {
			m = m + 1;
		} else {
			if (a[i] > elem){
			M = M + 1;
		} else {
			I = I + 1;
		} 
	}
	return struct comp_t
	{
		int m;
		int I;
		int M;
	};

}

struct comp_t {
int menores;
int iguales;
int mayores;
}

 int main() {
 	int x
    printf("Calcular los numeros con respecto al numero: ");
    scanf("%d\n",x);
    
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
    
    struct comp_t res = struct comp_t cuantos (a[],N,x)
    printf("\nMenores: %i \nIguales: %i \nMayores: ",res.menores,res,iguales,res.mayores);







} 