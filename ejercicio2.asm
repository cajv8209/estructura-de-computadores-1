.data
numbers: .word 10, 5, 8   # ingeso de tres números, 

.text
.globl main

main:
    la $t0, numbers       # Cargar  arreglo de números en $t0
    lw $t1, 0($t0)        # Cargar el primer número en $t1
    lw $t2, 4($t0)        # Cargar el segundo número en $t2
    lw $t3, 8($t0)        # Cargar el tercer número en $t3

    slt $t4, $t1, $t2     # Comparar $t1 con $t2 y guardar el resultado en $t4
    beqz $t4, check_t3    # Saltar a check_t3 si $t1 no es menor que $t2
    move $t1, $t2         # Si $t1 es menor que $t2, guardar $t2 en $t1

check_t3:
    slt $t4, $t1, $t3     # Comparar $t1 con $t3 y guardar el resultado en $t4
    beqz $t4, print_min   # Saltar a print_min si $t1 no es menor que $t3
    move $t1, $t3         # Si $t1 es menor que $t3, guardar $t3 en $t1

print_min:
    li $v0, 1             # Cargar el código de la llamada al sistema para imprimir un entero
    move $a0, $t1         # Cargar el número menor en $a0
    syscall               # Llamar al sistema para imprimir el número menor

    li $v0, 10            # Cargar el código de la llamada al sistema para salir del programa
    syscall               # Llamar al sistema para salir