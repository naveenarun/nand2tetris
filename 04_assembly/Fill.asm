// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.


@SCREEN
D=A
@0
M=D
@1
M=-1

(READKEY)
@KBD
D=M
@PLOTANDADD
D;JNE
@CLEARANDMINUS
0;JMP

(PLOTANDADD)
@1
D=M
@0
A=M
M=D

@0
D=M
@SCREEN
D=D-A
@8192
D=D-A
@READKEY
D;JGT
@0
M=M+1

@READKEY
0;JMP

(CLEARANDMINUS)
@0
A=M
M=0

@0
D=M
@SCREEN
D=D-A
@READKEY
D;JEQ

@0
M=M-1
@READKEY
0;JMP


(END)
@END
0;JMP

