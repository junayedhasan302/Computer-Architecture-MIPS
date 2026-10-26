
# MIPS Reference Tables

## 1. MIPS Register Number Table

| Register Name | Decimal Number | 5-bit Binary |
|---|---:|---|
| `$zero` | 0 | `00000` |
| `$at` | 1 | `00001` |
| `$v0` | 2 | `00010` |
| `$v1` | 3 | `00011` |
| `$a0` | 4 | `00100` |
| `$a1` | 5 | `00101` |
| `$a2` | 6 | `00110` |
| `$a3` | 7 | `00111` |
| `$t0` | 8 | `01000` |
| `$t1` | 9 | `01001` |
| `$t2` | 10 | `01010` |
| `$t3` | 11 | `01011` |
| `$t4` | 12 | `01100` |
| `$t5` | 13 | `01101` |
| `$t6` | 14 | `01110` |
| `$t7` | 15 | `01111` |
| `$s0` | 16 | `10000` |
| `$s1` | 17 | `10001` |
| `$s2` | 18 | `10010` |
| `$s3` | 19 | `10011` |
| `$s4` | 20 | `10100` |
| `$s5` | 21 | `10101` |
| `$s6` | 22 | `10110` |
| `$s7` | 23 | `10111` |
| `$t8` | 24 | `11000` |
| `$t9` | 25 | `11001` |
| `$k0` | 26 | `11010` |
| `$k1` | 27 | `11011` |
| `$gp` | 28 | `11100` |
| `$sp` | 29 | `11101` |
| `$fp` / `$s8` | 30 | `11110` |
| `$ra` | 31 | `11111` |

---
# Remembering Tricks
## 1. Register Number Table
- `$zero=0`, `$at=1`, `$v0–$v1=2–3`, `$a0–$a3=4–7` — প্রথমে 1, 1, 2, 4টি।
- `$t0–$t7 = 8–15` — 8 থেকে শুরু, ধারাবাহিকভাবে 8টি।
- `$s0–$s7 = 16–23` — 16 থেকে শুরু, ধারাবাহিকভাবে 8টি।
- `$t8–$t9 = 24–25`, `$k0–$k1 = 26–27` — এরপর 2টি T, 2টি K।
- `$gp=28`, `$sp=29`, `$fp=30`, `$ra=31` — শেষের 4টি Special Register।


## 2. MIPS R-format Function Code (`funct`) Table

| Decimal | 6-bit Binary | Instruction | Full Form / Meaning |
|---:|---|---|---|
| 0 | `000000` | `sll` | Shift Left Logical |
| 2 | `000010` | `srl` | Shift Right Logical |
| 3 | `000011` | `sra` | Shift Right Arithmetic |
| 4 | `000100` | `sllv` | Shift Left Logical Variable |
| 6 | `000110` | `srlv` | Shift Right Logical Variable |
| 7 | `000111` | `srav` | Shift Right Arithmetic Variable |
| 8 | `001000` | `jr` | Jump Register |
| 9 | `001001` | `jalr` | Jump And Link Register |
| 12 | `001100` | `syscall` | System Call |
| 13 | `001101` | `break` | Breakpoint |
| 16 | `010000` | `mfhi` | Move From HI |
| 17 | `010001` | `mthi` | Move To HI |
| 18 | `010010` | `mflo` | Move From LO |
| 19 | `010011` | `mtlo` | Move To LO |
| 24 | `011000` | `mult` | Multiply Signed |
| 25 | `011001` | `multu` | Multiply Unsigned |
| 26 | `011010` | `div` | Divide Signed |
| 27 | `011011` | `divu` | Divide Unsigned |
| 32 | `100000` | `add` | Add |
| 33 | `100001` | `addu` | Add Unsigned |
| 34 | `100010` | `sub` | Subtract |
| 35 | `100011` | `subu` | Subtract Unsigned |
| 36 | `100100` | `and` | Bitwise AND |
| 37 | `100101` | `or` | Bitwise OR |
| 38 | `100110` | `xor` | Bitwise XOR |
| 39 | `100111` | `nor` | Bitwise NOR |
| 42 | `101010` | `slt` | Set on Less Than |
| 43 | `101011` | `sltu` | Set on Less Than Unsigned |


# Remembering Tricks
## 2. R-format Function Code (`funct`) Table
- `0, 2, 3` → `sll, srl, sra` — Shift instructions; 1 নম্বর code নেই।
- `4, 6, 7` → `sllv, srlv, srav` — একই Shift pattern, শুধু শেষে `v`।
- `8, 9` → `jr, jalr`; `12, 13` → `syscall, break` — ছোট ছোট জোড়ায় মনে রাখো।
- `16–19` → `mfhi, mthi, mflo, mtlo`; `24–27` → `mult, multu, div, divu`।
- `32–39` → `add, addu, sub, subu, and, or, xor, nor`; `42–43` → `slt, sltu`।

**Practice Tip:** প্রতিদিন টেবিল না দেখে code-গুলো লেখো, তারপর মিলিয়ে ভুলগুলো ঠিক করো।