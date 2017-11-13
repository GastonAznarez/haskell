#include <stdio.h>

int main() {

  int N, i;

  printf("Cuantos elementos va a tener el arreglo? \n");
  scanf("%d", &N);

  int a[N];
  int b[N];
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

  for (i = 0; i < N; i++) {
    b[i] = a[N-i-1];
  }

  printf("El arreglo al revez es: ");
  i = 0;
  while (i < N) {
    printf("%d  ", b[i]);
    i++;
  }
  printf("\n");

  return 0;
}
