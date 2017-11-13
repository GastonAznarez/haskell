/* Ejercicio 2
*/
Int main() {
  Int x,y,z;
   printf ("Inserte el valor de x: ")
     scanf ("%i\n", x)
   printf ("Inserte el valor de y: ")
     scanf ("%i\n", y)
    printf ("Inserte el valor de z: ")
      scanf ("%i\n", z)
  /* Precondicion: True */
  z = x;
  x = y;
  y = z;
  printf("\nSus variables cambiadas serian: \nx = %i \ny = %i \nz = %i",x,y,z );
return 0
}