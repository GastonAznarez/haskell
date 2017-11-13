#include <stdio.h>


int main (){
 	int y,z,N;
   
   printf("Cuantos elementos va a tener el arreglo? \n");
  scanf("%d", &N);

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
    printf("%d \n", a[i]);
    i++;
  }
     printf("Inserte el la posicion del primer numero que desea cambiar: ");
    scanf("%d",&z);

    printf("Inserte el la posicion del segundo numero que desea cambiar: ");
    scanf("%d",&y);

    int aux;
	aux = a[y];
	a[y] = a[z];
	a[z] = aux;

    printf("\nEl arreglo quedaria: ");
     i = 0;
    while (i < N) {
	printf("%d ", a[i]);
	i++;
}

return 0;

}

