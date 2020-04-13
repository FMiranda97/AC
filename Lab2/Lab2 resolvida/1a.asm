#consideracoes iniciais:
#escrever num endereço altera o  pixel correspondente no bitmap display
#o endereço do primeiro pixel da linha seguinte é o endereço a seguir ao último da linha atual. 
#Ou seja a mudança de linha não existe em memória sendo apenas uma interpretação do simulador


li $t0, 0x10010000 #address of first pixel
li $s0, 0x00FFFF00 #yellow color

li $t1, 0 #t1 is a counter for column, will increase every time we write a pixel and reset to 0 when we change line
li $t2, 0 #t2 is a counter for lines, will increase whenever we write 30 pixels and change line

loop:
	sw $s0, 0($t0) #write code for yellow on adress of a pixel
	addi $t0, $t0, 4 #change address in $t0 to address of next pixel (each pixel is defined by 4 bytes)
	addi $t1, $t1, 1 #increment counter for column
	blt $t1, 30, loop #if counter lower than 30 write next pixel
	
li $t1, 0 #resets column counter, didn't jump back to loop on previous line, meaning we wrote 30 pixels and will now change line
addi $t0, $t0, 136 #go to first pixel of next line. We wrote 30 pixels, each line has 64, so we need to skip remaining 34. 34*4 = 136 (each pixel is defined by 4 bytes)
addi $t2, $t2, 1 #increase line counter
blt $t2, 20, loop #if we wrote less than 20 lines, write next pixel