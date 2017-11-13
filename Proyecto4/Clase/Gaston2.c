#include <stdio.h>

int main() {

  int N, i;

  printf("Cuantos elementos va a tener cada vector? \n");
  scanf("%d", &N);

  int a[N];
  int b[N];
  i = 0;
  while (i < N) {
    printf("Inserte el elemento de la posición %d del vector 1: ", i);
    scanf("%d", &a[i]);
    i++;
  }

  i = 0;
  while (i < N) {
    printf("Inserte el elemento de la posición %d del vector 2: ", i);
    scanf("%d", &b[i]);
    i++;
  }

  printf("Usted insertó los siguientes vectores: ");
  printf("v1 = (");
  i = 0;
  while (i < N) {
    printf("%d", a[i]);
    if (i==(N-1)) {
      printf("), v2 = (");
    } else {
      printf(",");
    }
    i++;
  }

  i = 0;
  while (i < N) {
    printf("%d", b[i]);
    if (i==(N-1)) {
      printf(")\n");
    } else {
      printf(",");
    }
    i++;
  }



  printf("El resultado es: %i \n", prod(a, b, N));


  return 0;
}

int prod(int a[], int b[], int tam) {
  int s = 0;
  for (int i = 0; i < tam; i++) {
    s += a[i] * b[i];
  }
  return s;
}
