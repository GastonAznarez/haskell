#include <stdio.h>

int main() {
    int n, fibn0, fibn1, i, aux;
    i = 2;
    fibn0 = 1;
    fibn1 = 1;

    printf("Inserte el puto numero: ");
    scanf("%d", &n);

    while (i <= n) {
      aux = fibn1;
      fibn1 += fibn0;
      fibn0 = aux;
      i++;
    }

    printf("Fib(%d) = %d\n", n, fibn1);
    return 0;
}
