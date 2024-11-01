(LOOP)
	// RAM[0] = SCREEN
	@SCREEN
	D=A
	@R0
	M=D

(CHECK_KBD)
	// if RAM[KBD], Then goto BLACK, ELSE goto WHITE
	@KBD
	D=M
	@BLACK
	D;JNE
	@WHITE
	D;JEQ

	@CHECK_KBD
	0;JMP


(BLACK)
	@R1
	M=-1
	@FILL
	0;JMP

(WHITE)
	@R1
	M=0
	@FILL
	0;JMP

(FILL)
	// *(RAM[0]) =RAM[1]
	@R1
	D=M
	@R0
	A=M
	M=D

	// KBD - (SCREEN + 1)
	@R0
	D=M+1
	@KBD
	D=A-D

	@R0
	M=M+1

	@LOOP
	D;JEQ

	@FILL
	0;JMP
