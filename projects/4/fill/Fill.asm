// Fill.asm
@BLACK
M=-1
@WHITE
M=0
@is_kbd_input
M=0
@8192
D=M
@All_words
M=D // 256 * 32

(LOOP)
	// 키보드 입력 확인
	@KBD
	D=M
	@is_kbd_input
	M=D
	
	// 키보드 입력이 있는 경우 픽셀을 black, or white
	@is_kbd_input
	D=M	
	@WHITE
	D;JEQ
	@BLACK
	D;JGT


(WHITE)
    @WHITE
    D=M
    @color
    M=D
    @fill
	0;JMP
	
(BLACK)
    @BLACK
    D=M
    @color
    M=D
    @fill
    0;JMP

(FILL)
	@All_words
	D=M
	@n
	M=D
	@i
	M=0
	
	@Short_loop
	0;JMP
	
(Short_loop)
    @n
    D=M
    @i
    D=D-M
    @LOOP
    D;JEQ		// if i == n, Then goto LOOP

				// fill the screen with color
    @i
    D=M
    @SCREEN
    A=D+A	// A = SCREEN + i
    D=A
    @temp
    M=D		// temp = SCREEN + i
    @color
    D=M
    @temp
    A=M
    M=D 		// RAM[temp] = color

    @i
    M=M+1

    @Short_loop
    0;JMP
        
