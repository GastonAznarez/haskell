#include <stdio.h>

int suma_hasta(int N) {
    return (N*(N-1))/2; //+N si es inclusivo
}

int main() {
    int n;

    printf("Inserte el puto numero: ");
    scanf("%d", &n);

    printf("La suma hasta %d es %d \n", n, suma_hasta(n));
    return 0;
}
