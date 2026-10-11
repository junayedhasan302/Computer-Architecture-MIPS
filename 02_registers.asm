
# Junayed Hasan
# Program: Add two numbers using registers

.text
.globl main

main:
    li $t0, 10          # Store 10 in $t0
    li $t1, 20          # Store 20 in $t1

    add $t2, $t0, $t1   # Add both numbers and store in $t2

    li $v0, 1           # Select print-integer service
    move $a0, $t2       # Pass the result to $a0
    syscall             # Print the result

    li $v0, 10          # Select exit service
    syscall             # Exit the program
