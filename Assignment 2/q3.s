.global calculate
.text

calculate:
    movq $0, %r8        # Init loop iterator
.L0:
    cmp %r8, %rdi       # Compare iterator with string length
    je .L6              # Jump if equal (end)
    movzbq (%rsi, %r8, 1),%r9   # Load byte at offset r8
    inc %r8             # Increment iterator
    cmp $32, %r9        # Check if byte is space
    je .L0              # Jump if space
    cmp $48, %r9        # Compare with ASCII 48 ('0')
    js .L1              # Jump if less than '0'

    subq $48, %r9       # Convert ASCII to integer
    pushq %r9           # Push integer onto stack
    jmp .L0             # Jump to loop start

.L2:
    addq %r10, %rax     # Add r10 to rax
    pushq %rax          # Push result onto stack
    jmp .L0             # Jump to loop start

.L1:
    popq %r10           # Pop last value into r10
    popq %rax           # Pop second last value into rax
    cmp $43, %r9        # Compare with ASCII 43 
    je .L2              
    cmp $45, %r9        # Compare with ASCII 45 
    je .L3              
    cmp $42, %r9        # Compare with ASCII 42 
    je .L4            
    cmp $47, %r9        # Compare with ASCII 47 
    je .L5              

.L5:
    movq $0, %rdx       # Clear rdx
    idivq %r10          # Divide rax by r10
    pushq %rax          # Push result onto stack
    jmp .L0             # Jump to loop start

.L3:
    subq %r10, %rax     # Subtract r10 from rax
    pushq %rax          # Push result onto stack
    jmp .L0             # Jump to loop start

.L4:
    imulq %r10          # Multiply rax by r10
    pushq %rax          # Push result onto stack
    jmp .L0             # Jump to loop start

.L6:
    popq %rax           # Pop final result into rax
    ret                 # Return
