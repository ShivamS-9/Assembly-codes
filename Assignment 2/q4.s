.global calculate
.text

calculate:
   pushq %rbp       # save base pointer
   movq %rsp, %rbp  # Set base pointer

   mov $0,%r10      # Initialize loop iterator to 0
   mov $1,%r9       # Initialize r9 to 1
   sal $3,%r9       # Shift left by 3 
   mov $6,%rax      # Move 6 to rax
   imul %r9         # Multiply rax by r9
   mov %rax,%r9     # Store the result in r9 

.L1:
   cmp %rsi,%r10        # Compare loop iterator with n
   je .L5               # Jump to .L5 if equal
   movzbq (%rdi,%r10,1),%r8   # Load the element of array at index r10 into r8
   cmp $67,%r8          # Compare r8 with ASCII value of 'C'
   je .L3               # Jump to .L3 if equal 
   cmp $43,%r8          # Compare r8 with ASCII value of '+'
   je .L2               # Jump to .L2 if equal 
   cmp $68,%r8          # Compare r8 with ASCII value of 'D'
   je .L4               # Jump to .L4 if equal 
   sub %r9,%r8          # Subtract 48 from r8 
   pushq %r8            # Push the result onto stack
   incq %r10            # Increment the loop iterator
   cmp %r10,%rsi        # Compare loop iterator with size of the array
   jge .L1              # Jump to .L1 if iterator is greater than or equal to size


.L4:
   pop %r14   # pop last value from the stack

   push %r14  # Push the original value back onto the stack
   sal $1, %r14  # Double the value of r14
   push %r14     # Push the doubled value onto the stack

   inc %r10      # Move to the next element
   cmp %r10, %rsi
   jge .L1     # Jump if iterator < n


.L2:
   pop %r14             # Pop last two values
   pop %r13
   mov %r14,%rcx        # Move r14 to rcx
   add %r13,%rcx        # Add r13 to rcx, rcx will store the sum
   push %r13            # Push r13 back onto the stack
   push %r14            # Push r14 back onto the stack
   push %rcx            # Push the sum onto the stack
   inc %r10             # Increment the loop iterator
   cmp %r10,%rsi        # Compare loop iterator with n
   jge .L1              # Jump to .L1 if iterator is greater than or equal to size

.L3:
   pop %r14             # Pop last value from the stack
   inc %r10             # Increment the loop iterator
   cmp %r10,%rsi        # Compare loop iterator with size of the array
   jge .L1              # Jump to .L1 if iterator is greater than or equal to size

.L6:   
   pop % r12            # Pop a value from the stack into r12
   add %r12,%r15        # Add the popped value to r15
   cmp %rsp,%rbp        # Compare the stack pointer with the base pointer
   je .L7               # Jump to .L7 if they are equal (end of loop)
   jmp .L6              # Jump to .L6 (continue looping)


.L5:
   mov $0,%r15          # Initialize r15 to 0 (r15 will store the final answer)
   jmp .L6              # Jump to .L6


.L7:
    mov %r15,%rax 
    popq %rbp          # Restore base pointer
    ret               
