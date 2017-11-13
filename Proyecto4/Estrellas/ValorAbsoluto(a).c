#include <stdio.h>

int main() {
  int x;
  printf("Inserte el puto numero ");
  scanf("%d", &x);
  if(x < 0) {
    x = -x;
  }

  printf("El valor absoluto es %i\n", x );

  return 0;
}
