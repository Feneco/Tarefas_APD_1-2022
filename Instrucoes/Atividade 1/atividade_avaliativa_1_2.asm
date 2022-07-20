# i = $s0
# g = $s1
# &A = $s2

########################################
# Código de debug

#! load array index with 
# %addr Array address
# %ti   temporary index register
# %i    index (literal)
# %val  value to store
.macro laiw(%addr, %ti, %i, %val)
	li %ti, 0
	addi %ti, %ti, %i
	add %ti, %ti, %ti
	add %ti, %ti, %ti
	add %ti, %addr, %ti
	sw  %val, 0(%ti)
.end_macro

li $s0, 2					# pré carregando i com 2
li $s1, 5					# pré carregando g com 5
li $s2, 0x10010000			# pré carregando &A com 0x10010000
li $t2, 0xCCCC				# Pré carregando A[i] = 0xCCCC
laiw($s2, $t0, 2, $t2)
li $t2, 0x1111				# Pré carregando A[0] = 0x1111
laiw($s2, $t0, 0, $t2)



########################################
# Código principal :

# Carregando A[i] em $t0 e A[0] em $t1
li  $t0, 4
mul $t0, $s0, $t0
add $t0, $s2, $t0			# $t0 = i * 4 + &A
lw  $t0, 0($t0) 			# $t0 = A[i]
lw  $t1, 0($s2)				# $t1 = A[0]
# Calculando equação e movendo resultado para $t0
sub $t0, $t0, $t1			# $t0 = A[i] - A[0]
add $t0, $t0, $s1			# $t0 = g + A[i] - A[0]
# Calculando (4*i + 4*g + &A) e movendo resultado para $t1
li  $t1, 4
mul $t1, $s0, $t1
add $t1, $s2, $t1			# $t1 = i * 4 + &A
li  $t2, 4
mul $t2, $s1, $t2			# $t2 = g * 4
add $t1, $t1, $t2			# $t1 = i * 4 + g * 4 + &A
# Armazenando $t0 em A[i+g]
sw  $t0, 0($t1)				# A[i+g] = $t0

