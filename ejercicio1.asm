.data
    numbers: .word 10, 5, 8   # ingreso de tres números,

.text
.globl main

main:
    la $t0, numbers         # Cargar  arreglo de números en $t0
    lw $t1, 0($t0)          # Cargar el primer número en $t1
    lw $t2, 4($t0)          # Cargar el segundo número en $t2
    lw $t3, 8($t0)          # Cargar el tercer número en $t3

                    # Comparar $t1 con $t2 y guardar el mayor en $t1
    slt $t4, $t1, $t2       # Comparar $t1 < $t2
    beqz $t4, skip          # Saltar si $t1 >= $t2
    move $t1, $t2           # Si $t1 < $t2, guardar $t2 en $t1

skip:
                    # Comparar $t1 con $t3 y guardar el mayor en $t1
    slt $t4, $t1, $t3       # Comparar $t1 < $t3
    beqz $t4, end           # Saltar si $t1 >= $t3
    move $t1, $t3           # Si $t1 < $t3, guardar $t3 en $t1

end:
    li $v0, 10             # El número mayor estará en $t1
    syscall                # Terminar la ejecución del programa
    
    


    
