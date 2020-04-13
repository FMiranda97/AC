sum_v4: sum_v4.o soma.o adicional.o ciclos.o
	gcc -o sum_v4 sum_v4.o soma.o adicional.o 
sum_v4.o: sum_v4.c soma.h adicional.h ciclos.h
	gcc -c sum_v4.c 
soma.o: soma.c   
	gcc -c soma.c
adicional.o: adicional.c
	gcc -c adicional.c
ciclos.o: ciclos.c
	gcc -c ciclos.c
