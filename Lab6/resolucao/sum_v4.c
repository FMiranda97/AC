#include <stdio.h>
#include "soma.h"
#include "adicional.h"
#include "ciclos.c"

int main(){
  int a,b,c;

  printf("Enter the first number: ");
  scanf("%d",&a);
  printf("Enter the second number: ");
  scanf("%d",&b);

  c=vfor(a, b);

  printf("with a = %d and b = %d we get c = %d\n",a,b,c);
}
