# From Nand To Tetris

## Project4 - Machine Language

#### 예제 1

프로그램: `Add.asm`

계산: RAM[2] = RAM[0] + RAM[1] + 17

사용법: RAM[0]과 RAM[1]에 값을 입력한다.

```pseudocode
# Pseudo Code

R2 = R0 + R1 + 17
```

```assembly
@R0
D=M
@R1
D=D+M
@17
D=D+A
@R2
M=D

@END
	0;JMP
```



#### 예제 2

프로그램: `Sum1ToN.asm`

RAM[1]=1+2+3+...+RAM[0]을 계산한다.

사용법: value>=1을 RAM[0]에 넣는다.

```pseudocode
# Pseudo Code

i=1;
sum = 0;

LOOP:
	if (i > R0), Then goto STOP;
	sum = sum + i;
	i++;
	goto LOOP;

STOP:
	R1 = sum;
```

```assembly
@i
M=1
@sum
M=0

(LOOP)
	// if (i > R0), Then goto STOP;
	@i
	D=M
	@R0
	D=D-M
	@STOP
	D;JGT
	
	// sum+=i;
	@i
	D=M
	@sum
	M=M + D
	// i++;
	@i
	M=M+1
	
	@LOOP
	0;JMP
	
(STOP)
	@sum
	D=M
	@R1
	M=D
	
(END)
	0;JMP
```



#### 예제 3

프로그램: `PointerDemo.asm`

시작 주소 R0부터 시작해서 처음 나오는 R1개 단어에 -1을 설정한다.

```pseudocode
# Pseudo Code
n = 0;
LOOP:
	if (n == R1), Then goto END;
	*(R0 + n) = -1;
	n += 1;

END:
```

```assembly
    // n=0;
@n
M=0

(LOOP)
    // if (n == R1), Then goto END
	@n
	D=M;
	@R1
	D=D-M
	@END
	D;JEQ
    // *(R0+n)=-1
    @ R0
    D=M
    @ n
    A=D+M
    M=-1
    
    // n+=1;
    @n
    M=M+1
    
    @LOOP
    0;JMP;   

(END)
	0;JMP
```

