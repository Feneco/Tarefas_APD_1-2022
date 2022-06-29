# A = $s2
# i = $s0
# g = $s1
addi $s2, $s2, 0x10010000	# Carregando cabeça do vetor A com 0x10010000
addi $s0, $s0, 2		# i = 2
addi $s1, $s1, 5		# g = 5

add  $t0, $s0, $s0		# t0 = i + i
add  $t0, $t0, $t0		# t0 = t0 + t0 = 2i+2i = 4i
add  $t0, $t0, $s2		# t0 = t0 + &A
lw   $t5, 0($t0)		# $t5 = A[i]
lw   $t6, 0($s2)		# $t6 = A[0]
sub  $t6, $t5, $t6		# $t6 = $t5 - $t6 = A[i] - A[0]
add  $t6, $t6, $s1		# $t6 = $t6 + g
add  $t7, $s1, $s1
add  $t7, $t7, $t7		# $t7 = 4 * g
add  $t0, $t0, $t7		# $t0 = &A[i] + 4 * g
sw   $t6, 0($t0)