#include <stdio.h>
#include <math.h>


bool esprimo(int n){
	int r = sqrt n;
	bool p = false;
	for (int i = 0; i < r && !p; ++i)
	 {
	 	p = n % i == 0;
	 }
	 return p;
}

int main(){

   bool r =  esprimo(x);
   while (r){

         printf("Ingrese el Numero: ");
         scanf("%d\n",x);

       if (x<0){printf("\nEl numero debe ser positivo");}
       else {if r {
            printf("\nEl numero es primo");
                  } else {
  	                     printf("\nEl numero no es primo");
                         }
	        }
            }
}
