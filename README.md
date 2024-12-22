# CSO Assignments - x86 Assembly Code

## Overview
This repository contains the solutions for **Assignment 1** and **Assignment 2** of the **CSO: Computer Systems Organization** course. The assignments involve implementing various algorithms using **x86 Assembly** and **C**. 

### Assignment 1
- Implemented solutions to problems involving:
  - Finding the lonely number in an array
  - Rotating an array to the left by one index
  - Checking if a string is a palindrome
  - Finding the sum of the largest and smallest elements in an array
  - Calculating the product of all elements except one in an array

### Assignment 2
- Implemented solutions for more advanced problems, including:
  - Finding the maximum subarray sum with additional constraints on subarray length
  - Calculating combinations using recursion
  - Evaluating postfix expressions
  - Calculating baseball game scores with special operations
  - Implementing binary search on a sorted list of integers

## Folder Structure
Each question from Assignment 1 and Assignment 2 has its own folder containing the respective **Assembly (.s)** and **C (.c)** files.

## Files Overview
- **.s files**: These contain the x86 Assembly code for solving the respective problem.
- **.c files**: These are used to handle input/output operations, calling the Assembly functions.

## Instructions
- The C files are strictly used for input/output; all logic is implemented in Assembly.
- Code is commented with detailed explanations of the logic and steps taken.
- Please ensure to handle edge cases for each problem.

## Usage
1. Clone the repository to your local machine.
2. For each question, compile and run the corresponding C file, which will invoke the Assembly code to solve the problem.

Example for **q1**:
```bash
gcc q1.c -o q1
./q1
