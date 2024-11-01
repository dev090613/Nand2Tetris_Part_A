### About this project

컴퓨터를 구성하는 가장 작은 부품 중 하나인 NAND gate를 기본 블록으로
밑바닥부터 컴퓨터를 완전히 구현해본다.

더 나아가, hardware 부분뿐만 아니라,
software 부분(VM, compliler, programming language etc)까지도 직접 만들어 볼 예정이다.

이 과정에서 거대한 프로젝트를 작은 모듈로 나누고, 이들의 기능을 추상화(abstraction)하고,
각각 구현(implementation)하면서 컴퓨터의 근간을 이루는 기본 원리에 대하여 학습한다.

현재 project1-3까지 완성하였다
- NAND gate를 이용하여 기본 4가지 논리 게이트(Not, And, Or, Xor)와 Multiplexer, Demultiplexer 등을 만들었다.
- 이것을 토대로 HalfAdder, FullAdder, ALU 등 combinational chip을 만들었다.
- 하드웨어에 이산적인 시간 개념을 도입하기 위하여 DFF를 기본 단위로 하는 sequential chips(bit, register, RAM)을 만들었다.

# Projects

- **Project 1: Boolean Logic**

  - [project1(1)](notes/1(Boolean Logic)(1).md)

  - [project1(2)](notes/1(Boolean Logic)(2).md)

  - [project1(3)](notes/1(Boolean Logic)(3).md)

- **Project 2: Boolean Arithmetic**
  - [project2(1)](notes/2(Boolean Arithmetic)(1).md)
  - [project2(2)](notes/2(Boolean Arithmetic)(2).md)
  
- **Project 3: Memory**
  - [project3(1)](notes/3(Memory)(1).md)
  - [project3(2)](notes/3(Memory)(2).md)
  
- **Project 4: Machine Language**
  - [project4: cheet sheet](notes/4(Machine Language)(1).md)
  - [project4: exercise](notes/4(Machine Language)(2).md)
  - [project4: project](notes/4(Machine Language)(3).md)

- **Project 5: Computer Architecture**
  - [project5](notes/5.md)

- **Project 6: Assembler**
  - [project6](notes/6.md)
