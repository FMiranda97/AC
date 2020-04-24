binariza: main.o bin_img.o
	gcc main.o bin_img.o -o binariza
main.o: main.c
	gcc -c main.c
bin_img.o: bin_img.s
	gcc -c bin_img.s -g
