#include <stdio.h>
#include <math.h>

void ordenar(int arr[], int n)
{
   int i, key, j;
   for (i = 1; i < n; i++)
   {
       key = arr[i];
       j = i-1;


       while (j >= 0 && arr[j] > key)
       {
           arr[j+1] = arr[j];
           j = j-1;
       }
       arr[j+1] = key;
   }
}

int main()
{

  int N, i;

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
    printf("%d  ", a[i]);
    i++;
  }
  printf("\n");

  ordenar(a, N);

  printf("El arreglo ordenado es: ");
  i = 0;
  while (i < N) {
    printf("%d  ", a[i]);
    i++;
  }
  printf("\n");

  return 0;
}
