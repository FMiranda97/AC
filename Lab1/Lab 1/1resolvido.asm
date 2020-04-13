#pressionar F1 para aceder à descrição das funções dos mips
li $25, 5 #iniciar valor do registo a 5
li $26, 3 #iniciar valor do registo a 3

addi $17, $25, 0 #$17 = $25 + 0
addi $18, $26, 0 #$18 = $26 + 0

sub $19, $17, $18 #$19 = $17 - $18
add $20, $18, $19 #$20 = $18 - $19
sub $21, $19, $20 #$21 = $19 - $20
add $22, $20, $21 #$22 = $20 - $21
sub $23, $21, $22 #$23 = $21 - $22
add $24, $22, $23 #$24 = $22 - $23

