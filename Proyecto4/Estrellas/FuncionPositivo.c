#include <stdio.h>

int main() {

  int f, i, N;

  printf("Seleccione el numero de funcion que deseas usar\n  1.existe_positivo\n  2.todos_positivos\n");
  scanf("%d", &f);

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

  if (f == 1) {
    int p = 0;
    for (int l = 0; l < N; l++) {
      if (a[l] >= 0){
        printf("Existe un positivo en el arreglo y es %i\n", a[l]);
        p++;
        break;
      }
    }
    if (p == 0) {
      printf("No hay ningun positivo en el arreglo\n");
    }
  } else if (f == 2) {
    int p = 0;
    for (int l = 0; l < N; l++) {
      if (a[l] < 0) {
        printf("No todos son positivos\n");
        p++;
        break;
      }
    }
    if (p == 0) {
      printf("Todos son positivos\n");
    }
  }

  return 0;
}
