// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

    // Ensure R2 is 0
    @R2
    M=0

    // Grab one of the values and make it a counter
    @R0
    D=M
    @i
    M=D

(LOOP)
    // Keep adding R1 to R2 while i > 0
    @i
    D=M
    @END
    D;JLE // Terminate loop if i<= 0

    // R2 += R1
    @R1
    D=M
    @R2
    M=M+D

    // i -= 1
    @i
    M=M-1
    
    // Loop back
    @LOOP
    0;JMP

(END)
    @END
    0;JMP
