// 1
if (x != y) {
    u = z - w;
} else {
    u = z + w;
}

// 2
int t0 = a[8];
t0 += x;
a[12] = t0;
// ou 
a[12] = a[8] + x;

// 3
| Formato R                           |
| op   | rs  | rt  | rd  |shant|opcode|
|000000|10001|01111|01011|00000|100010| //sub $t3, $s1, $t7

| Formato I                         |
| op   | rs  | rt  | constante      |
|100011|01011|01111|0000010010110000| // lw $t7,1200($t3)
