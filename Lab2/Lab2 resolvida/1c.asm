#consideracoes iniciais:


li $t0, 0x10010000 #address of first pixel

li $t1, 0 #t1 is a counter for column, will increase every time we write a pixel and reset to 0 when we change line to a maximum of 32
li $t2, 0 #t2 is a counter for lines, will increase whenever we write 64 pixels and change line


#FIRST LOOP TO PAINT BACKGROUND BLUE
loop:
	jal decide_color #jump to function below, will store value on $s0 of the color to use based on the counters of lines and columns on registers $t2 and $t1
	sw $s0, 0($t0) #write code for color on adress of a pixel
	addi $t0, $t0, 4 #change address in $t0 to address of next pixel (each pixel is defined by 4 bytes)
	addi $t1, $t1, 1 #increment counter for column
	blt $t1, 64, loop #if counter lower than 30 write next pixel
li $t1, 0 #resets column counter, didn't jump back to loop on previous line, meaning we wrote 30 pixels and will now change line
#since we wrote all pixels of the line address already skipped to first pixel of next line
addi $t2, $t2, 1 #increase line counter
blt $t2, 32, loop #if we wrote less than 20 lines, write next pixel

decide_color:
	blt $t2, 12, blue #if below line 12 or above line 20, color is blue
	bgt $t2, 20, blue
	blt $t1, 28, blue #if conditions above were false then we're on the lines of the square
	bgt $t1, 36, blue #if column is between 28 and 36 then color is magenta
	j magenta
	blue:
		li $s0, 0x000000FF #blue color
		jr $ra
	magenta:
		li $s0, 0x00FF00FF #mangenta color
		jr $ra