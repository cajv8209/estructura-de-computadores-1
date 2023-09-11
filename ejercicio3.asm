.data
fibonacci: .word 0:15      # se almacenan los números de la serie Fibonacci

.text
.globl main

main:
              # se inicia con los primeros números de la serie
li $t0, 0                 # Primer número de Fibonacci
li $t1, 1                 # Segundo número de Fibonacci

              # se almacena los primeros números en el arreglo fibonacci
sw $t0, fibonacci($zero)  # se guarda el primer número
sw $t1, fibonacci($4)     # se guarda el segundo número

             # se generan los siguientes números de la serie
li $t2, 2                 # Índice del siguiente número a generar
li $t3, 15                # Cantidad total de números a generar 

fibonacci_loop:
add $t4, $t0, $t1         # Sumamos los dos números anteriores
sb $t4, fibonacci($t2)    # se guarda el resultado en fibonacci[i]
addi $t2, $t2, 4          # se incrementa el índice
addi $t3, $t3, -1         # se decrementa la cantidad restante
bnez $t3, fibonacci_loop  # Saltamos al bucle si aún quedan números por generar

             # Imprimimos los números de la serie Fibonacci
li $v0, 1                 # Código de la llamada al sistema para imprimir un entero
li $t2, 0                 # Reiniciamos el índice

print_loop:
lw $a0, fibonacci($t2)    # Cargamos el número de fibonacci[i] para imprimirlo
syscall
addi $t2, $t2, 4          # Incrementamos el índice
blt $t2, 60, print_loop   # Saltamos al bucle si aún quedan números por imprimir

           # Terminamos el programa
li $v0, 10                # Código de la llamada al sistema para salir del programa
syscall