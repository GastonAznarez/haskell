#include <stdio.h>

int main() {
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
    printf("%d \n", a[i]);
    i++;
  }

  struct datos_t res = min_max(a, N);

  printf("El minimo es: %i, y el maximo: %i\n", res.minimo, res.maximo);

}

struct datos_t min_max(int b[], int N) {
  struct datos_t res;
  int min, max;
  min = b[0];
  max = b[0];
  for (int i = 1; i < N; i++) {
    if (b[i] < min) {
      min = b[i];
    }
    if (b[i] > max) {
      max = b[i];
    }
  }
  res.maximo = max;
  res.minimo = min;

  return res;
}

struct datos_t {
  int maximo;
  int minimo;
};
