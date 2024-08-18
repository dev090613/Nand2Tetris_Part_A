# From Nand To Tetris

## Project1 - Boolean Logic

### 1. Implementation of NOT Gate from NAND Gate

![image-20240817102838237](images/image-20240817102838237.png)

**About Not gate**

- Why? input signal을 reverse한다. Manipulation, Inverter
- What? If the input is 1 (high), the output is 0 (low), and if the input is 0 (low), the output is 1 (high).
  - **Interface of Not Gate** ![image-20240817105423561](images/image-20240817105423561.png)

- How? 하나의 NAND Gate를 이용하여 구현한다.
  - **HDL of Not Gate**: ![image-20240817103308647](images/image-20240817103308647.png)



---

### 2. Implementation of AND Gate from NAND Gate

![image-20240817104552722](images/image-20240817104552722.png)

**About And Gate**

- Why? 둘 이상의 input에 대하여 and operation을 수행하기 위함이다.
  - Boolean expression of AND gate: `𝑋.𝑌=𝑍`

- What? 
  - **Interface**![image-20240817110914267](images/image-20240817110914267.png)

- How? 두 개의 `NOT`(또는 `NAND`) Gate를 이용하여 구현한다.
  - **HDL**![image-20240817110957182](images/image-20240817110957182.png)

- related: 
  - `NAND` Gate: NAND(A, B)



---

### 3. Implementation of OR Gate from NAND Gate

![image-20240817113302471](images/image-20240817113302471.png)

**About OR Gate**

- Why?

- What?
  - Interface ![image-20240817113405485](images/image-20240817113405485.png)

- How?
  - HDL ![image-20240817113440336](images/image-20240817113440336.png)



---

### 4. Implementation of XOR Gate from NAND Gate

![image-20240817113506208](images/image-20240817113506208.png)

**About XOR Gate**

- Why?

- What?
  - Interface ![image-20240817113530772](images/image-20240817113530772.png)

- How?
  - HDL ![image-20240817113545615](images/image-20240817113545615.png)

