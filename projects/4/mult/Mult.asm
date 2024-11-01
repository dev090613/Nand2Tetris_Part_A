// Mult.asm
@R2
M = 0

(LOOP)
                # if RAM[1] == 0, Then goto END
	@R1
	D = M
    @END
	D;JEQ
                # result += RAM[0]
	@R0
	D = M
	@R2
	M = M + D
                # RAM[1]--;
	@R1
	M = M - 1
	@LOOP
	0;JMP

(END)
	0;JMP
