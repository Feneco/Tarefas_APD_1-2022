begin:  addi $t0, $zero, 0
		addi $t1, $zero, 20
loop:	slt  $t2, $a0,   $t1
		beq  $t2, $zero, finish
		add  $t0, $t0,   $t1
		addi $t1, $t1,   3
		j    loop
finish:	add  $v0, $t0,   $zero


1.c)

v = 0
for(w = 20; y < w; w += 3){
    v += w
}
z = v
