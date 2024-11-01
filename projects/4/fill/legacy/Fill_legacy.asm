// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(LOOP)
// 스크린의 시작주소(16384)를 RAM[0]에 담는다
@SCREEN
D=A
@R0
M=D // RAM[0]=16384, RAM[0]는 screen의 시작 주소를 가리킨다

// 키보드를 확인한다
(CHECK_KBD)
@KBD
D=M
@BLACK
D;JNE
@WHITE
D;JEQ

@CHECK_KBD // Keep checking KBD
0;JMP

// RAM[KBD]에 값이 존재O, BLACK
(BLACK)
@1
M=-1 // RAM[1]=-1, RAM[1]은 색을 저장한다.
@FILL
0;JMP
// RAM[KBD]에 값이 존재X, WHITE
(WHITE)
@1
M=0
@FILL
0;JMP

// RAM[1]에 저장한 색으로 화면을 채운다.
(FILL)
@1
D=M // D=-1
@R0
A=M // 16384
M=D // RAM[16384]=-1

@R0
D=M+1 // D=16384+1
@KBD // KBD의 시작 주소는 24576
D=A-D // D=24576-(16384+1), full fill 시 zero

@R0 // RAM[0]에 저장된 주소 update(16385)
M=M+1

@FILL
D;JGT

@LOOP
0;JMP