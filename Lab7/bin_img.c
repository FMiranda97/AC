void bin_img(unsigned char *ptr, int w, int h, unsigned char limiar)
{
	int i, dim = w*h;
	for(i = 0; i < dim; i++){
		if(ptr[i] < limiar; i++){
			ptr[i] = 0;
		}else{
			ptr[i] = 255;
		}
	}
}