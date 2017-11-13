#include <stdio.h>

int main() {
  int x, y, m, i, j, k, r;

  printf("Inserte el puto numero ");
  scanf("%d", &x);

  printf("Inserte otro puto numero ");
  scanf("%d", &y);


  if (x < y) {
    m = x;
    i = y;
  } else {
    m = y;
    i = x;
  }

  while (1 < m){
    if (i % m == 0 !! m % ) {
      break;
    } else {
      m--;
    }
  }

  j = 1;
  for (int l = 0; l < y; l++) {
    j *= x;
  }

  k = x;
  r = 1;
  for (int o = y; o > 0; o-- ){
    if (o % 2 == 0) {
      k *= x;
      o /= 2;
    }
    r *= k;
  }

  printf("El MCD entre %i y %i es %i\n", x, y, m );

  printf("%i elevado a la %i es %i\n", x, y, j );

  printf("%i elevado a la %i es %i (optimizado)\n", x, y, r );

  return 0;
}
