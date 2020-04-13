int vfor(int a, int b){
	int c1 = 1, c2 = 1, i;
	for(i = 0; i < b; i++){
		c1*=b-a;
	}
	for(i = 0; i < a; i++){
		c2*=b+a;
	}
	return c1 + c2;
}

int vwhile(int a, int b){
	int c1=1, c2=1, i = 0;
	while(i < b){
		c1*=b-a;
		i++;
	}
	i = 0;
	while(i < a){
		c2*=b+a;
		i++;
	}
	return c1 + c2;
}

int vdo(int a, int b){
	int c1 = 1, c2 = 1, i = 0;
	do{
		c1+=b-a;
	}while(i < b);
	i = 0;
	do{
		c2*=b+a;
	}while(i < a);
	return c1 + c2;
}

