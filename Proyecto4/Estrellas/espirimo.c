#include <stdio.h>
#include <math.h>
#include <stdbool.h>



int esprimo(int n){
	int p = 0;
	for (int i = 0; i < n && p==0; i++)
	 {
	 	if (n % i == 0) {p=1;} ;

	 }
	 return p;
}

int main(){

   int x;
	printf("Ingrese el Numero: ");
         scanf("%i\n",&x);
	int r =  esprimo(x);
   while (r){

         

       if (x<0){printf("\nEl numero debe ser positivo");}
       else {if (r) {
            printf("\nEl numero es primo");
                  } else {
  	                     printf("\nEl numero no es primo");
                         }
	        }
            }
}
