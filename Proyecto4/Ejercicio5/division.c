#include <stdio.h>

struct div_t {
    int cociente;
    int resto;
};

struct div_t division(int x, int y) {
  struct div_t res;
  while ( x >= y ) {
    x -= y;
  }
  res.cociente = y;
  res.resto = x;
  return res;
}

int main() {
    int x = 8;
    int y = 2;

    struct div_t res = division(x, y);
    printf("El cociente es %d y el resto %d\n", res.cociente, res.resto);
    return 0;
}
