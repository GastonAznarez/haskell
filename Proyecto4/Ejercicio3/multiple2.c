#include <stdio.h>

int main() {
  int x, y, z, aux;

  printf("Inserte el puto numero ");
  scanf("%d", &x);

  printf("Inserte otro puto numero ");
  scanf("%d", &y);

  printf("Inserte el ultimo puto numero ");
  scanf("%d", &z);

  aux = x;
  x = y;
  y = y + aux + z;
  z = y - z;

  printf("El valor de x = %i, y = %i, z = %i",x, y, z );

  return 0;

}
