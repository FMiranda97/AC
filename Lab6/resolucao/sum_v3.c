#include <stdio.h>
#include "soma.h"
#include "adicional.h"

int main(){
  int a,b,c;

  printf("Enter the first number: ");
  scanf("%d",&a);
  printf("Enter the second number: ");
  scanf("%d",&b);

  c=soma(a,b);

  printf("The sum of %d with %d is ",a,b);
  print_octal(c);
}
