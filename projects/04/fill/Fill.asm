// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(KBLOOP)
    // Get Keyboard Input
    @KBD
    D=M     // Keyboard input is in D

    // Set color to white or black
    @WHITE
    D;JEQ

    // Color setting
    @color
    M=-1
    @START
    0;JMP
(WHITE)
    @color
    M=0

(START)
    // Set start point in pos
    @SCREEN
    D=A
    @pos
    M=D

    (SCRNLOOP)
        // Set color
        @color
        D=M
        @pos
        A=M
        M=D

        // Increment pos pointer
        @pos
        M=M+1
        // Check if at end of screen
        @KBD
        D=A
        @pos
        D=D-M
        @SCRNLOOP
        D;JGT

    @KBLOOP
    0;JMP
