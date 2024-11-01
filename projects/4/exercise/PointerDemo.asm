// n = 0;
@n
M = 0

(LOOP)
	// if (n == R1), Then goto END
	@n
	D = M;
	@R1
	D = D - M
	@END
	D;JEQ
	// *(R0 + n) = -1
    @ R0
    D = M
    @ n
    A = D + M
    M = -1
    
	// n += 1;
    @n
    M = M + 1
    
    @LOOP
    0;JMP;   

(END)
	0;JMP
