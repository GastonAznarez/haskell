#include <stdio.h>


struct comp_t {
int menores;
int iguales;
int mayores;
};

struct comp_t cuantos(int a[], int tam, int elem){
	int m = 0;
	int n = 0;
	int j = 0;
	for (int i = 0; i < tam; ++i)
	{
		if (a[i] < elem) {
			m = m + 1;
		} else if (a[i] > elem){
			n = n + 1;
		} else {
			j = j + 1;
		}
	}

	struct comp_t res = {m,j,n};
	return res;
}	
		





 int main() {
 	int x, N, i;
   	 printf("Calcular los numeros con respecto al numero: ");
   	 scanf("%d",&x);


  	printf("Cuantos elementos va a tener el arreglo? \n");
 	 scanf("%d", &N);

    int a[N];
    i = 0;
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

    struct comp_t res = cuantos (a,N,x);
    printf("\nMenores: %i \nIguales: %i \nMayores: %i \n",res.menores,res.iguales,res.mayores);


}
