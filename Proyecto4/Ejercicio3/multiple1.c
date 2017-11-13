#include <stdio.h>

int main() {
  int x, y;

  printf("Inserte el puto numero ");
  scanf("%d", &x);

  printf("Inserte otro puto numero ");
  scanf("%d", &y);

  x++;
  y += x - 1;

  printf("El valor de x = %i, y = %i",x, y);

  return 0;

}
