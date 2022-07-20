# if(k==0){
#     f=i+j;
#     goto FINAL;
# } else if (k==1){
#     f=g+h;
#     goto FINAL;
# } else if (k==2){
#     f=g-h;
#     goto FINAL;
# } else if (k==3){
#     f=i-j;
#     goto FINAL;
# }
# 
# FINAL:

# k = $s0
# g = $s1
# h = $s2
# i = $s3
# j = $s4
# f = $s5

########################
# Valores de debug
li $s3, 2 					# i = 2
li $s4, 3					# j = 3
li $s1, 4					# g = 4
li $s2, 5					# h = 5
########################


beq $s0, $zero, L0			# k = 0
li  $s5, 1			
beq $s0, $s5,   L1			# k = 1
li  $s5, 2			
beq $s0, $s5,   L2			# k = 2
li  $s5, 3
beq $s0, $s5,   L3			# k = 3

L0: add $s5, $s3, $s4		# f = i + j
j FINAL						# break
L1: add $s5, $s1, $s2		# f = g + h
j FINAL						# break
L2: sub $s5, $s1, $s2 		# f = g - h
j FINAL						# break
L3: sub $s5, $s3, $s4 		# f = i - j
j FINAL
FINAL:
