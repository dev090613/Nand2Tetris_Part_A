@i
M = 1
@sum
M = 0

(LOOP)
	// if (i > R0), Then goto STOP;
	@i
	D = M
	@R0
	D = D - M
	@STOP
	D;JGT
	
	// sum += i;
	@i
	D = M
	@sum
	M = M + D
	
	// i++;
	@i
	M = M + 1
	
	@LOOP
	0;JMP
	
(STOP)
	@sum
	D = M
	@R1
	M = D
	
(END)
	0;JMP
