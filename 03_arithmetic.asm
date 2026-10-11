
# Junayed Hasan
# Program: MIPS Arithmetic Operations

.data
# Store the text messages in memory.
# Each label is a name for a message.

sumMsg:  .asciiz "Sum: "                 # Label for addition message
subMsg:  .asciiz "\nSubtraction: "       # \n starts a new line
addiMsg: .asciiz "\nAddi: "              # Label for addi message
multMsg: .asciiz "\nMultiplication: "    # Label for multiplication message
divMsg:  .asciiz "\nDivision quotient: " # Label for quotient message
remMsg:  .asciiz "\nDivision remainder: "# Label for remainder message

.text                    # .text contains executable instructions.
.globl main              # .globl main makes main visible as a program entry label.

main:
    # Store the numbers that we will use in calculations.
    li $t0, 27           # Put 20 into temporary register $t0
    li $t1, 4            # Put 5 into temporary register $t1

    # ---------------- ADDITION ----------------
    add $t2, $t0, $t1    # $t2 = 20 + 5 = 25

    li $v0, 4            # MARS service 4 means print a string --> li = load immidiet
    la $a0, sumMsg       # Put the address of "Sum: " into $a0 --> la = load address
    syscall              # Ask MARS to print that string

    li $v0, 1            # MARS service 1 means print an integer
    move $a0, $t2        # Copy the result (25) into argument register $a0
    syscall              # Ask MARS to print the integer

    # ---------------- SUBTRACTION ----------------
    sub $t2, $t0, $t1    # $t2 = 20 - 5 = 15

    li $v0, 4            # Select print-string service
    la $a0, subMsg       # Pass the subtraction message address
    syscall              # Print "Subtraction: "

    li $v0, 1            # Select print-integer service
    move $a0, $t2        # Pass the subtraction result (15)
    syscall              # Print 15

    # ---------------- ADD IMMEDIATE ----------------
    addi $t2, $t0, 3     # $t2 = 20 + 3 = 23

    li $v0, 4            # Select print-string service
    la $a0, addiMsg      # Pass the Addi message address
    syscall              # Print "Addi: "

    li $v0, 1            # Select print-integer service
    move $a0, $t2        # Pass the addi result (23)
    syscall              # Print 23

    # ---------------- MULTIPLICATION ----------------
    mult $t0, $t1        # Multiply 20 * 5; result goes into HI and LO
    mflo $t2             # Copy the lower 32 bits from LO into $t2

    li $v0, 4            # Select print-string service
    la $a0, multMsg      # Pass the multiplication message address
    syscall              # Print "Multiplication: "

    li $v0, 1            # Select print-integer service
    move $a0, $t2        # Pass the multiplication result (100)
    syscall              # Print 100

    # ---------------- DIVISION ----------------
    div $t0, $t1         # Divide 20 by 5; quotient goes to LO, remainder to HI
    mflo $t2             # Copy quotient (4) from LO into $t2
    mfhi $t3             # Copy remainder (0) from HI into $t3

    li $v0, 4            # Select print-string service
    la $a0, divMsg       # Pass the quotient message address
    syscall              # Print "Division quotient: "

    li $v0, 1            # Select print-integer service
    move $a0, $t2        # Pass the quotient (4)
    syscall              # Print 4

    li $v0, 4            # Select print-string service
    la $a0, remMsg       # Pass the remainder message address
    syscall              # Print "Division remainder: "

    li $v0, 1            # Select print-integer service
    move $a0, $t3        # Pass the remainder (0)
    syscall              # Print 0

    # ---------------- EXIT ----------------
    li $v0, 10           # MARS service 10 means exit the program
    syscall              # Stop program execution
