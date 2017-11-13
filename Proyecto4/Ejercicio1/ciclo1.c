#include <stdio.h>

int main() {
    int x, y, i;
    x = 0;
    y = 0;
    i = 0;

    printf("Inserte el dividendo: ");
    scanf("%d", &x);
    printf("Inserte el divisor: ");
    scanf("%d", &y);

    i = 0;
    while (y <= x) {
      x -= y;
      i++;
    }

    printf("El resultado es %i y el resto es %i",i,x);

    return 0;
}
