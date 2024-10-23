// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

	@R0
	D=M
	@mult1
	M=D
	
	@R1
	D=M
	@mult2
	M=D
	
	@R2
	M=0
	
	@i
	M=0
	
(LOOP)
	@i
	D=M
	@mult2
	D=D-M
	@END
	D; JEQ // se (i-mult2 == 0) roda END;
	
	@mult1
	D=M
	@R2
	M=M+D  // soma mult1 e R2
	
	@i     // contador
	M=M+1
	
	@LOOP
	0; JMP

(END)
	@END
	0; JMP