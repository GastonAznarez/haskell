#include <stdio.h>
#include <stdbool.h>

int main() {
    int x, i;
    bool res = true;
    i = 2;

    printf("Inserte el puto numero ");
    scanf("%d", &x);

    while(x > i && res) {
      res = x % i != 0;
      i++;
    }

    if (res && x > 1) {
	printf("El número es primo. \n");
    } else {
	printf("El número no es primo. \n");
    }

    return 0;
}
