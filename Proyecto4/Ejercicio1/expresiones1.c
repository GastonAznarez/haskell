/*
Cómo compilar:

gcc -Wall -pedantic -std=c99 -o expresiones1 expresiones1.c

Cómo ejecutar:

./expresiones1

*/


#include <stdio.h>  // printf, scanf
#include <stdbool.h> // bool

/* En este ejercicio no usar scanf, sólo asignaciones y printf. */

int main() {
    bool b, w;
    int x, y, z;
    x = 4;
    y = 5;
    z = 4;
    b = false;
    w = true;

    printf("El valor de la expresión es %d \n",  x + y + 1);
    printf("El valor de la expresión es %d \n",  z * z + y * 45 - 15 * x);
    printf("El valor de la expresión es %d \n",  x < z && !w);
    printf("El valor de la expresión es %d \n",  y - 2 == (x * 3 + 1) % 5);
    printf("El valor de la expresión es %d \n",  y / 2  * x);
    printf("El valor de la expresión es %d \n",  10 < x || b);

    return 0;
}
