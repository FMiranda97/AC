#consideracoes iniciais:
#multiplicar por 2 é o mesmo que fazer um deslocamento para a esquerda de 1 bit.
#para calcular as cores faz-se o calculo individual de cada uma delas e de seguida desloca-se o red em 2 bytes, o green em 1 byte e o blue em 0 bytes
#cor = 0x00RRGGBB = 0x00RR0000 + 0x0000GG00 + 0x000000BB = 0x000000RR << 16 + 0x000000GG << 8 + 0x000000BB

li $t0, 0x10010000 #address of first pixel
li $s0, 0x00FFFF00 #yellow color

li $t1, 0 #t1 is a counter for column, will increase every time we write a pixel and reset to 0 when we change line to a maximum of 32
li $t2, 0 #t2 is a counter for lines, will increase whenever we write 64 pixels and change line

loop:
	li $s0, 0 #set initial color to 0
	sll $t3, $t2, 18 #calculate red component [multiply by 4 and then shift 2 bytes (2*8+2 = 18)]
	add $s0, $s0, $t3 #add red component to color
	sll $t3, $t1, 10 #calculate green component [multiply by 4 and then shift 1 byte (8+2 = 10)]
	add $s0, $s0, $t3 #add red component to color
	#blue component is 0 and is therefore not calculated
	
	sw $s0, 0($t0) #write code for color on adress of a pixel
	addi $t0, $t0, 4 #change address in $t0 to address of next pixel (each pixel is defined by 4 bytes)
	addi $t1, $t1, 1 #increment counter for column
	blt $t1, 64, loop #if counter lower than 30 write next pixel
li $t1, 0 #resets column counter, didn't jump back to loop on previous line, meaning we wrote 30 pixels and will now change line
#since we wrote all pixels of the line address already skipped to first pixel of next line
addi $t2, $t2, 1 #increase line counter
blt $t2, 32, loop #if we wrote less than 20 lines, write next pixel