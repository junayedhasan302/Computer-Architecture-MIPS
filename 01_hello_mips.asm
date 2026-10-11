
# Junayed Hasan
# Program: Print Hello, MIPS!

.data
message: .asciiz "Hello, MIPS!\n"

.text
.globl main

main:
    li $v0, 4          # Select print-string service
    la $a0, message    # Load message address
    syscall            # Print the string

    li $v0, 10         # Select exit service
    syscall            # Exit the program
