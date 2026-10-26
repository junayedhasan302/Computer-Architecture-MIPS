# MIPS Architecture — CT Questions and Answers

## Question 1: Write a MIPS assembly program to count the elements of array B that are greater than y.

### Answer

**Register Mapping:**

| Variable | Register |
|---|---|
| Base address of B | `$s0` |
| y | `$s1` |
| count | `$s2` |
| i | `$s3` |

```asm
li $s2, 0           # Initialize count = 0
li $s3, 0           # Initialize i = 0
li $t0, 8           # Set array size = 8

Loop:
    slt $t1, $s3, $t0   # Check whether i < 8
    beq $t1, $zero, Exit # Exit if i >= 8
    sll $t2, $s3, 2     # Calculate byte offset i * 4
    add $t2, $s0, $t2   # Calculate address of B[i]
    lw $t3, 0($t2)      # Load B[i]
    slt $t4, $s1, $t3   # Check whether y < B[i]
    beq $t4, $zero, Skip # Skip if B[i] <= y
    addi $s2, $s2, 1    # Increment count

Skip:
    addi $s3, $s3, 1    # Increment i
    j Loop              # Repeat the loop

Exit:
```

The final count is stored in `$s2`.

---

## Question 2: Write a MIPS assembly program to calculate the sum of X[k] for k < 12.

### Answer

**Register Mapping:**

| Variable | Register |
|---|---|
| Base address of X | `$s5` |
| Sum | `$t0` |
| k | `$t1` |

```asm
li $t0, 0           # Initialize sum = 0
li $t1, 0           # Initialize k = 0
li $t2, 12          # Set loop limit = 12

Loop:
    slt $t3, $t1, $t2   # Check whether k < 12
    beq $t3, $zero, Exit # Exit if k >= 12
    sll $t4, $t1, 2     # Calculate byte offset k * 4
    add $t4, $s5, $t4   # Calculate address of X[k]
    lw $t5, 0($t4)      # Load X[k]
    add $t0, $t0, $t5   # Add X[k] to sum
    addi $t1, $t1, 1    # Increment k
    j Loop              # Repeat the loop

Exit:
```

The final sum is stored in `$t0`.

---

## Question 3: Write a MIPS assembly program to add D[j] to total when D[j] <= limit.

### Answer

**Register Mapping:**

| Variable | Register |
|---|---|
| Base address of D | `$s2` |
| limit | `$v1 = 20` |
| total | `$v0` |
| j | `$s4` |

```asm
li $v0, 0           # Initialize total = 0
li $s4, 0           # Initialize j = 0
li $t0, 8           # Set array size = 8

Loop:
    slt $t1, $s4, $t0   # Check whether j < 8
    beq $t1, $zero, Exit # Exit if j >= 8
    sll $t2, $s4, 2     # Calculate byte offset j * 4
    add $t2, $s2, $t2   # Calculate address of D[j]
    lw $t3, 0($t2)      # Load D[j]
    slt $t4, $v1, $t3   # Check whether limit < D[j]
    bne $t4, $zero, Skip # Skip if D[j] > limit
    add $v0, $v0, $t3   # Add D[j] to total

Skip:
    addi $s4, $s4, 1    # Increment j
    j Loop              # Repeat the loop

Exit:
```

The final total is stored in `$v0`.

---

## Question 4: Decode the following hexadecimal machine codes into MIPS assembly instructions.

### Answer

| Hexadecimal | Binary (`opcode \| rs \| rt \| rd \| shamt \| funct`) | Decoded Fields | Assembly Instruction |
|---|---|---|---|
| `0x01854020` | `000000 01100 00101 01000 00000 100000` | `rs=12 ($t4)`, `rt=5 ($a1)`, `rd=8 ($t0)`, `funct=32 (ADD)` | `add $t0, $t4, $a1` |
| `0x02264824` | `000000 10001 00110 01001 00000 100100` | `rs=17 ($s1)`, `rt=6 ($a2)`, `rd=9 ($t1)`, `funct=36 (AND)` | `and $t1, $s1, $a2` |
| `0x01476822` | `000000 01010 00111 01101 00000 100010` | `rs=10 ($t2)`, `rt=7 ($a3)`, `rd=13 ($t5)`, `funct=34 (SUB)` | `sub $t5, $t2, $a3` |

---

## Question 5: Decode the following hexadecimal machine codes into MIPS assembly instructions.

### Answer

| Hexadecimal | Binary (`opcode \| rs \| rt \| rd \| shamt \| funct`) | Decoded Fields | Assembly Instruction |
|---|---|---|---|
| `0x02525020` | `000000 10010 10010 01010 00000 100000` | `rs=18 ($s2)`, `rt=18 ($s2)`, `rd=10 ($t2)`, `funct=32 (ADD)` | `add $t2, $s2, $s2` |
| `0x01646024` | `000000 01011 00100 01100 00000 100100` | `rs=11 ($t3)`, `rt=4 ($a0)`, `rd=12 ($t4)`, `funct=36 (AND)` | `and $t4, $t3, $a0` |
| `0x01A37825` | `000000 01101 00011 01111 00000 100101` | `rs=13 ($t5)`, `rt=3 ($v1)`, `rd=15 ($t7)`, `funct=37 (OR)` | `or $t7, $t5, $v1` |

---

## Question 6: Convert the following MIPS assembly instructions into binary and hexadecimal machine codes.

### Answer

| Assembly Instruction | Binary (`opcode \| rs \| rt \| rd \| shamt \| funct`) | Hexadecimal |
|---|---|---|
| `add $s0, $t2, $t3` | `000000 01010 01011 10000 00000 100000` | `0x014B8020` |
| `sub $s1, $t5, $t6` | `000000 01101 01110 10001 00000 100010` | `0x01AE8822` |
| `and $s2, $t8, $t9` | `000000 11000 11001 10010 00000 100100` | `0x03199024` |
| `or $s3, $s4, $s5` | `000000 10100 10101 10011 00000 100101` | `0x02959825` |
| `sll $t4, $s6, 3` | `000000 00000 10110 01100 00011 000000` | `0x001660C0` |

---

## Question 7: Convert the following MIPS assembly instructions into binary and hexadecimal machine codes.

### Answer

| Assembly Instruction | Binary (`opcode \| rs \| rt \| rd \| shamt \| funct`) | Hexadecimal |
|---|---|---|
| `sub $t0, $s1, $s2` | `000000 10001 10010 01000 00000 100010` | `0x02324022` |
| `add $t1, $s3, $s4` | `000000 10011 10100 01001 00000 100000` | `0x02744820` |
| `or $t2, $s5, $s6` | `000000 10101 10110 01010 00000 100101` | `0x02B65025` |
| `and $t3, $s7, $t0` | `000000 10111 01000 01011 00000 100100` | `0x02E85824` |
| `srl $t5, $t1, 4` | `000000 00000 01001 01101 00100 000010` | `0x00096902` |

---

## Question 8: Translate the following expression into MIPS assembly and machine code.

Given:

`x = ((y + z) - (z + w)) << 2;`

### Register Mapping

| Variable | Register |
|---|---|
| x | `$s0` |
| y | `$s1` |
| z | `$s2` |
| w | `$s3` |
| Temporary values | `$t0`, `$t1`, `$t2` |

### Answer

| Step | MIPS Instruction | Binary (`opcode \| rs \| rt \| rd \| shamt \| funct`) | Hexadecimal |
|---|---|---|---|
| 1 | `add $t0, $s1, $s2` | `000000 10001 10010 01000 00000 100000` | `0x02324020` |
| 2 | `add $t1, $s2, $s3` | `000000 10010 10011 01001 00000 100000` | `0x02534820` |
| 3 | `sub $t2, $t0, $t1` | `000000 01000 01001 01010 00000 100010` | `0x01095022` |
| 4 | `sll $s0, $t2, 2` | `000000 00000 01010 10000 00010 000000` | `0x000A8080` |

---

## Question 9: Translate the following expression into MIPS assembly and machine code.

Given:

`p = ((a - b) + (b + c)) >>> 1;`

### Register Mapping

| Variable | Register |
|---|---|
| p | `$s0` |
| a | `$s1` |
| b | `$s2` |
| c | `$s3` |
| Temporary values | `$t0`, `$t1`, `$t2` |

### Answer

| Step | MIPS Instruction | Binary (`opcode \| rs \| rt \| rd \| shamt \| funct`) | Hexadecimal |
|---|---|---|---|
| 1 | `sub $t0, $s1, $s2` | `000000 10001 10010 01000 00000 100010` | `0x02324022` |
| 2 | `add $t1, $s2, $s3` | `000000 10010 10011 01001 00000 100000` | `0x02534820` |
| 3 | `add $t2, $t0, $t1` | `000000 01000 01001 01010 00000 100000` | `0x01095020` |
| 4 | `srl $s0, $t2, 1` | `000000 00000 01010 10000 00001 000010` | `0x000A8042` |

**Note:** `>>>` means logical right shift. MIPS uses `srl` for this operation.

---

## Question 10: What are the primary addressing modes supported in MIPS architecture? Explain each mode briefly and identify which addressing mode offers the fastest execution speed, providing justification for your choice.

### Answer

Addressing modes specify how an instruction accesses its operands or determines the location of data. The primary addressing modes supported in MIPS are described below.

**1. Register Addressing:** Operands are stored in CPU registers. It is commonly used for arithmetic and logical operations.

Example: `add $t0, $t1, $t2`

**2. Immediate Addressing:** A constant value is provided directly within the instruction.

Example: `addi $t0, $t1, 10`

**3. Base/Displacement Addressing:** The effective memory address is calculated by adding an offset to a base register. It is mainly used for load and store instructions.

Example: `lw $t0, 4($s0)`

**4. PC-Relative Addressing:** The target address is calculated relative to the Program Counter (PC). It is commonly used in conditional branch instructions.

Example: `beq $t0, $t1, label`

**5. Pseudo-Direct Addressing:** A jump target address is formed using the upper bits of the next PC value and the 26-bit target field of the instruction.

Example: `j target`

**Fastest Addressing Mode:** Register addressing is generally considered the fastest because the operands are already stored in CPU registers. Therefore, it avoids the additional memory access required to retrieve operands from main memory.

---

## Question 11: What are the different Instruction formats in MIPS assembly? Explain with example.

### Answer

MIPS architecture supports three primary instruction formats: R-format, I-format, and J-format. Each instruction is 32 bits long, but their field arrangements and purposes are different.

| Particulars | R-format (Register) | I-format (Immediate) | J-format (Jump) |
|---|---|---|---|
| **Definition** | Used for arithmetic and logical operations on registers. | Used for immediate values, memory access, and conditional branching. | Used for jump instructions to transfer program execution. |
| **Structure** | `opcode \| rs \| rt \| rd \| shamt \| funct` | `opcode \| rs \| rt \| immediate` | `opcode \| target address` |
| **Field Size** | 6 + 5 + 5 + 5 + 5 + 6 = **32 bits** | 6 + 5 + 5 + 16 = **32 bits** | 6 + 26 = **32 bits** |
| **Fields and Functions** | `opcode` (6 bits): identifies the instruction type; `rs` (5 bits): first source register; `rt` (5 bits): second source register; `rd` (5 bits): destination register; `shamt` (5 bits): shift amount; `funct` (6 bits): specifies the operation. | `opcode` (6 bits): identifies the instruction; `rs` (5 bits): source or base register; `rt` (5 bits): target register; `immediate` (16 bits): contains a constant value or offset. | `opcode` (6 bits): identifies the jump instruction; `target address` (26 bits): contains the encoded jump target. |
| **Example** | `add $t0, $t1, $t2` | `addi $t0, $t1, 10` | `j target` |
| **Explanation** | Adds the values in `$t1` and `$t2` and stores the result in `$t0`. | Adds `10` to the value in `$t1` and stores the result in `$t0`. | Transfers program execution to the specified jump target. |

**Conclusion:** R-format is mainly used for register operations, I-format for immediate, memory, and branch operations, and J-format for jump operations. All three formats are 32 bits long, but their field arrangements differ.