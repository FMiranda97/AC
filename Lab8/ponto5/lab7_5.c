#include <stdio.h>

int max (int*, int);

int min (int*, int);

int main ()
{
	int a[4] = {4, 6, 3, 5};
	int vMax,vMin;
	
	vMax = max (a, 4);
	vMin = min (a, 4);
	
	printf ("O valor maximo: %d\n",vMax);
	printf ("O valor minimo: %d\n",vMin);
	
	return 0;
}
