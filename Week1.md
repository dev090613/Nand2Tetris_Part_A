> 좋은 모듈 디자인이란 무엇인가?
>
> 시스템의 나머지 부분을 신경쓰지 않아도 되도록 모듈을 독립적으로 만드는 것이다.
>
> .



---

<img src="images/image-20240618114658075.png" alt="image-20240618114658075" style="zoom:25%;" />

> 기능적인 관점에서 논리 설계에 가장 기본적인 요구사항이란, 어떤 방식이든 정해진 인터페이스를 따르는 게이트를 구현하는 것이다. 인터페이스를 표현하는 방법은 단 하나뿐이므로, 보통 진리표나 bool expression 등으로 표현된다. 하지만 이 interface를 implementation하는 방식은 여러가지가 존재한다.
>
> 종합하자면, 논리 설계 기술은, 기존에 구현된 게이트들을 활용하여, 주어진 게이트 추상화(명세specification 또는 인터페이스interface라고도 한다)를 구현하는 효율적인 방법을 찾는 것이다.

HDL을 이용해서 gate logic을 작성해볼 것이다.



---



![image-20240618135651377](images/image-20240618135651377.png)

HDL이 실제로 칩의 의도된 기능을 구현하였는지



![image-20240618140207868](images/image-20240618140207868.png)

chip(gate) logic을 HDL program으로 작성한 후 test를 거친다. 이 과정은 hardware simulator를 통해서 이루어진다

HDL을 작성한 후 gate logic이 정상적으로 작동하는지 hardware simulator를 이용하여 확인해볼 수 있다. test script가 제공되며 이를 통해서 unit test가 가능하다.

이 과정을 통해 프로그래밍 전반에서 이루어지는 testing, debugging 을 배울 수 있다.

실무적으로는, 본격적으로 칩을 생산하기 전에도 칩을 설계하고 디버깅하고 최적화하는 작업들을 모두 수행할 수 있다.

---

![image-20240618142542609](images/image-20240618142542609.png)



![image-20240618142534023](images/image-20240618142534023.png)

output file을 생성함으로써 테스트를 보다 용이하게 할 수 있다.



---

Hardware simulator



![image-20240618143858860](images/image-20240618143858860.png)

compare file 역시 script based simulation에서 중요한 역할을 한다. 이는 high-level language에서도 구현될 수 있으며, output file은 이 file과 비교되어 일치하지 않을 시 error를 반환한다.



![image-20240618144256942](images/image-20240618144256942.png)

실제 업무에서는 Hardware construction projects에 있어서 두 가지 role이 존재한다(system architects, developers).

본 프로젝트에서는 강사가 system architects, 학생들이 developer의 역할을 하는 것과 같다. 

Architectts는 chip API, test script, a compare file을 제공하는 일을 맡으며,

![image-20240618144515535](images/image-20240618144515535.png)

developers는 이 제공된 files를 가지고 chip의 interface 등을 파악하여 실제 implementation을 하는 일을 한다.

---

![image-20240618150638970](images/image-20240618150638970.png)



![image-20240618153653893](images/image-20240618153653893.png)

multi bit indexing - LSB(가장 오른쪽 비트), MSB(가장 왼쪽 비트)

![image-20240618153948473](images/image-20240618153948473.png)



---

![image-20240618154417527](images/image-20240618154417527.png)

본 프로젝트에서는 위의 15개의 gates(CHIP)을 구현할 것이다. 그 이유는 이들은 가장 일반적은 gates이기 때문이다.

![image-20240618154557911](images/image-20240618154557911.png)

![image-20240618155604197](images/image-20240618155604197.png)

Multiplexor는 sel의 bit에 따라 output이 결정된다.

![image-20240618155637913](images/image-20240618155637913.png)

![image-20240618175820688](images/image-20240618175820688.png)

Multiplexing과 demultiplexing은 주로 communications network에서 사용된다.



![image-20240618175950114](images/image-20240618175950114.png)

0..15 bits 순차적이 아닌 병렬적으로 동시에 이루어짐



![image-20240618180307112](images/image-20240618180307112.png)

예시(Xor), 완성한 chip이 제공된 test script를 통과한다면, 즉 specified hehavior를 만족한다면 원하던 칩을 만든 것이다.



![image-20240618180610349](images/image-20240618180610349.png)



![image-20240618181851617](images/image-20240618181851617.png)



---

---

Implementation of NOT Gate using NAND Gate

- 의문: Nand gate 의 입력은 a, b 두 개 인데, Not gate는 입력을 하나만 받지 않나?



About NOT gate

- NOT gate is a single input and single output. it reverses the input signal.

- The NOT gate is also called an inverter
- Truth table: If A is True the Y is False and if A is false then Y is true.



About NAND gate

- *NAND gate are universal gate so you can implement any basic logic gate from NAND gate.*
- [NAND gate](https://www.geeksforgeeks.org/what-is-nand-gate/) is a simple digital logic gate that represents “NOT-AND”.
- It produces output that is inverse of AND operation.
- If all inputs are true (1), the output is false (0).
- If any input is false (0) or all inputs are false (0), the output is true (1).

![image-20240619003437798](images/image-20240619003437798.png)

![image-20240619003502558](images/image-20240619003502558.png)



---



About And gate

![image-20240619003311835](images/image-20240619003311835.png)



![image-20240619003241828](images/image-20240619003241828.png)



---

OR gate



![image-20240619005019346](images/image-20240619005019346.png)