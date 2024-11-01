# From Nand To Tetris

## Project4 - Machine Language



### 곱셈 프로그램 작성하기(`Mult.asm`)

: RAM[0] * RAM[1]의 값을 RAM[2]에 저장하라.

```pseudocode
# Pseudo Code
# RAM[2] = RAM[1] * RAM[0];
# note: 하지만 곱셈 연산(*)을 지원하지 않음 

result = 0
LOOP:
	if RAM[1] == 0, Then goto END
    result += RAM[0]
    RAM[1]--;
    goto LOOP
END:
    RAM[2] = result
```

```assembly
@R2
M=0

(LOOP)
                // if RAM[1] == 0, Then goto END
	@R1
	D=M
    @END
	D;JEQ
                // result += RAM[0]
	@R0
	D=M
	@R2
	M=D+M
                // RAM[1]--;
	@R1
	M=M-1
	@LOOP
	0;JMP

(END)
	0;JMP
```



### I/O 처리 프로그램 작성하기(`Fill.asm`)

: 키보드 입력이 있는 경우 스크린의 모든 픽셀을 검정색으로 칠한다, 아니면 흰색으로 칠한다.

```pseudocode
// Pseudo Code
// Infinite loop
LOOP:
    // R0에 SCREEN의 시작주소 저장(16384, 0x4000)
	RAM[0] = SCREEN
	
	// CHECK_KBD(24576, 0x6000)
	if RAM[KBD], Then goto BLACK, ELSE goto WHITE

BLACK:
	RAM[1] = -1
	goto FILL
WHITE: 
	RAM[1] = 0
	goto FILL

FILL:
	// SCREEN의 시작 주소에 RAM[1]에 저장된 색상을 칠한다
	*(RAM[0]) = RAM[1]
	
	// screen을 전부 채웠는지
	D = (KBD - (RAM[0] + 1))
	
	// 색칠한 word의 다음 word로 이동
	RAM[0]++;
	
	if D == 0, Then goto LOOP, Else goto FILL
```

```assembly
(LOOP)
    // RAM[0] = SCREEN
    @SCREEN
    D=A
    @R0
    M=D

(CHECK_KBD)
    // 키보드 입력 확인
    @KBD
    D=M
    // R1에 색상 저장(흰색 또는 검정 색)
    @BLACK
    D;JNE    // 키보드 입력이 있으면 (0이 아니면) BLACK으로
    @WHITE
    D;JEQ    // 키보드 입력이 없으면 (0이면) WHITE로

    @CHECK_KBD
    0;JMP    // 계속해서 키보드 체크

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
    // SCREEN의 시작 주소에 RAM[1]에 저장된 색상을 칠한다
    // *(RAM[0]) = RAM[1] 
    @R1
    D=M
    @R0
    A=M
    M=D

    // screen을 전부 채웠는지 여부에 따라 loop하기 위해 D에 저장
    // D = (KBD - (RAM[0] + 1))
    @R0
    D=M+1
    @KBD
    D=A-D

    // // 색칠한 word의 다음 word로 이동, RAM[0]++;
    @R0
    M=M+1

	// if D == 0, Then goto LOOP, Else goto FILL
    @FILL
    D;JGT
    @LOOP
    0;JMP
```

Note 🌟

- screen: 256 * 512 픽셀로 구성

- each word(16-bit): 16개의 픽셀을 제어, 검정색(`1111111111111111`), 흰색(`0000000000000000`)

  - word 단위로 처리할 때의 이점 -> 픽셀 단위로 처리하는 것보다 16배 더 효율적

- 16384(SCREEN)부터 시작하여 24576(KBD)까지 각 word에 color를 입력

  - 총 register의 수: 24576 - 16384 = 8192 words
  - 8192 words * 16 = 256 * 512 pixels (전체 화면)

  ```html
  <!--SCREEN registers-->
  16384: 1111111111111111 ~ 첫 16 픽셀
  16385: 1111111111111111
  ...
  24575: 1111111111111111 - 마지막 16 픽셀
  <!--KBD registers-->
  24576: kbd 입력 상태(0 또는 !0)
  ```

  
