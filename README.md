# Assignment - Data Definition and Movement

This assignment focuses on defining variables and moving data into and between registers.

## Requirements

Write a 64-bit program using the MASM assembler and Intel syntax. Use the provided Visual Studio solution as a starting point. The program must satisfy the following requirements.

### 1. Variables

Define the following variables in the program:

| Variable Name | Data Size | Initial Value |
|:----|:--|:--|
| `Zero` | 64 bits | `0` |
| `EightBytes` | 64 bits | `0FEDCBA98EDCB6521h` |
| `FourBytes` | 32 bits | `7654321Fh` |
| `TwoBytes` | 16 bits | `0A987h` |
| `OneByte` | 8 bits | `43h` |
| Whatever you want | 64 bits | Leave uninitialized; no initial value should be specified. |

All values are unsigned integers.

### 2. Register initialization

Using only `MOV` instructions, load data into registers as outlined below:

1. Load zero into the registers `RAX`, `RBX`, `RCX`, `RDX`, `RSI`, `RDI`. Do not use the immediate (literal) value `0` to do this. Use the variable `Zero` as defined above.
1. Load non-zero values into the registers `R8`-`R15` (8 registers total). The values do not matter, as long as they are not zero. Use a different value for each register. Use immediate (literal) values to do this (do not use variables).
1. Load the value `-1` into `RAX`.
1. Copy the value of `EightBytes` into `RSI`.
1. Copy the value of `FourBytes` into `EBX`.
1. Copy the value of `TwoBytes` into `CX`.
1. Copy the value of `OneByte` into `DL`.

At this point, the register values should look like this:

```
RAX = FFFFFFFFFFFFFFFF
RBX = 000000007654321F
RCX = 000000000000A987
RDX = 0000000000000043
RSI = FEDCBA98EDCB6521
RDI = 0000000000000000
```

### 3. Register manipulation

Using only `XCHG` instructions, manipulate the registers so they end up with the following values: 

```
RAX = 000000007654321F
RBX = 00000000EDCBA987
RCX = 0000000000006543
RDX = 0000000000000021
RSI = FFFFFFFFFFFFFFFF
RDI = 0000000000000000

R8-R15 must remain the same.
```

### 4. Variable update

Copy the value of `RAX` into the variable that was left uninitialized.

## Notes

Remember that registers can be addressed to access different portions of the register. For example, `RAX` can be accessed as `EAX` (32-bit), `AX` (16-bit), `AH` (8-bit), `AL` (8-bit). Different operand sizes will affect instruction behavior. For example, `MOV AX, BX` will copy the low 16-bits of `RBX` into the low 16-bits of `RAX`. The textbook discusses register addressing on page 29.

A detailed description of this behavior can be found in the [Intel 64 Architecture manual](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html) (volume 1, section 3.4.1.1 General-Purpose Registers in 64-Bit Mode). The following quote from that section is of interest:

>64-bit operands generate a 64-bit result in the destination general-purpose register.

>32-bit operands generate a 32-bit result, zero-extended to a 64-bit result in the destination general-purpose register.

>8-bit and 16-bit operands generate an 8-bit or 16-bit result. The upper 56 bits or 48 bits (respectively) of the destination general-purpose register are not modified by the operation.

This behavior can be leveraged when implementing section three of the requirements (register manipulation) for this assignment.
