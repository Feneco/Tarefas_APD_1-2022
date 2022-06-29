addi $s2, $s2, -1000	# Carregando cabeça do vetor A com -1000

lw   $t0, 8($s2)		# $t0 = A[2]
add  $t1, $s1, $t0       # $t1 = g + A[2]
sw   $t1, 20($s2)		# A[5] = $t1
