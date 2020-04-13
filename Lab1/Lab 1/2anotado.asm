          .data
          #definicao de um array de words (valor definido por 4 bytes)
          #os valores de cada elemento do array são os expressos em notação hexadecimal
          #ERRO 1: 0x20 é o ascii para o caracter espaço, para remover o espaço duplo, remover o 0x20 duplicado
lab_n:    .word   0x50, 0x72, 0x6f, 0x67, 0x72, 0x61, 0x6d, 0x61, 0x6e, 0x64, 0x6f, 0x20, 0x6f, 0x20, 0x20, 0x4d, 0x49, 0x50, 0x53, 0x0d
	  
count:	.word 19 #definicao da variavel count de dimensao 4 bytes (word)
	  
msgtexto: .asciiz "Arquitetura de Computadores 2016/2017" #definicao de um array de caracteres (asciiz), cada caracter ocupa 1 byte

separator: .asciiz "->" #definicao de um array de caracteres (asciiz), cada caracter ocupa 1 byte
          .text

main:
	la  $a0,msgtexto    # $a0 <- msgtexto #no registo a0 é colocado o endereço do primeiro elemento da string acima definida
	#isto é uma chamada de função em assembly.
	#salta para a linha de código com a label "print_string"(linha xx) guarda o endereço da linha seguinte (linha xx neste documento no registo $ra) 
	jal print_string    # print it #Jump and link
	la	$a0,count   #coloca no registo $a0 o endereço de memoria da variavel count
	lw	$t0,0($a0)  #coloca em $t0 o valor lido da memoria no endereço $a0+0, ou seja, le o valor da variavel count (19)
        
        
	li  $a0,0x0A        # $a0 <- '\n' #0x0A é o correspondente ASCII ao caracter '\n'
	#isto é uma chamada de função em assembly.
	#salta para a linha de código com a label "print_char"(linha xx) guarda o endereço da linha seguinte (linha xx neste documento no registo $ra) 
	jal print_char      # print it
        
	li	$t1,0 # to be used as a counter #inicia o registo $t1 com o valor 0
	la	$a1, lab_n #carrega em #a1 o valor do endereço de memoria do primeiro elemento do array lab_n
loop:	
	#Carrega para o registo $t2 o valor encontrado no endereço de memoria $a1+4
	#Como cada elemento deste array ocupa 4 bytes, está efetivamente  a ler o segundo elemento do array
	#ERRO 2: o primeiro elemento do array é saltado, substituir o 4 por 0
	lw	$t2,4 ($a1) 
	move 	$a0,$t2 #o valor no registo $t2 é copiado para o registo $a0
	#isto é uma chamada de função em assembly.
	#salta para a linha de código com a label "print_char"(linha xx) guarda o endereço da linha seguinte (linha xx neste documento no registo $ra) 
	jal     print_char      # print corresponding char
    
	
	la	$a0, separator
	jal	print_string
	
		
	move    $a0,$t2				# $a0 <- lab_n[i]  , i.e. offset=4*i
	jal     print_int       # print value

	la	$a0, separator
	jal	print_string


	li 	$a0,'('
	jal     print_char      	
        	move 	$a0,$t1		# print counter value
	jal 	print_int			# call function
	li 	$a0,')'
	jal     print_char      # print it	
	li 	$a0,'\n'
	jal     print_char      # print it	
	#até aqui todos os mecanismos foram explicados anteriormente, procurar explicações acima.

	addi 	$t1,$t1,1 # increment counter #t1 é o contador do ciclo, iniciado antes da label loop
	addi	$a1,$a1,4 #a1 contem o endereço de um elemento do array
	#como cada elemento é constituído por 4 bytes, incrementar o endereço de 4 obtém o endereço do elemento seguinte
	
	blt	$t1,$t0,loop #BLT - branch if less than. se $t1 < $t0 (se counter < 19) salta para a label loop
	#caso contrario continua a correr o codigo para baixo, isto é um ciclo "do while"
	
finish:
	li      $v0, 10  # Exit the program #carrega no argumento $v0 a syscall de codigo 10 (exit, ver "F1 -> Syscalls" para mais informação)
	syscall #executa a syscall definida na linha anterior



# funcoes com chamadas ao sistema para imprimir inteiros, caracteres e strings
# (o argumento de entrada e' colocado em $a0 antes da chamada da funcao)

# print_int(int), $4 = $a0 = integer
print_int:
	li $v0,1 #carrega no argumento $v0 a syscall de codigo 1 (print int, ver "F1 -> Syscalls" para mais informação)
	syscall #executa a syscall definida na linha anterior
	jr $ra #salta para a linha de código apontada pelo registo $ra (return da função)

# print_char(char), $4 = $a0 = char
print_char:
	li $v0,11 #carrega no argumento $v0 a syscall de codigo 11 (print char, ver "F1 -> Syscalls" para mais informação)
	syscall #executa a syscall definida na linha anterior
	jr $ra #salta para a linha de código apontada pelo registo $ra (return da função)

		
# print_string(char *), $4 = $a0 = string
print_string:
	li $v0,4  #carrega no argumento $v0 a syscall de codigo 4 (print string, ver "F1 -> Syscalls" para mais informação)
	syscall #executa a syscall definida na linha anterior
	jr $ra #salta para a linha de código apontada pelo registo $ra (return da função)

