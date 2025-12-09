# Priority_Encoder_4x2_Design_Verification_using_SV
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## 1) Project Overview
- A **priority encoder** is a combinational circuit that encodes the highest-priority active input when multiple inputs are active simultaneously.
- Only the **highest-priority active input** is encoded into the output at a time.
- It prevents conflicts that can occur in ordinary encoders when two or more inputs are active at the same time.
- A priority encoder has **2ⁿ input** lines and **n output** lines, where the output represents the binary code of the highest-priority active input.
- Common types include **octal-to-binary**, **decimal-to-BCD**, and **keyboard encoders**.
- **Inputs**: a3, a2, a1, a0 (4 input lines, a3 has the highest priority, a0 has the lowest).
- **Outputs**: y1, y0 (2-bit binary output).
- **Valid (V) signal**: Indicates if any input is active.

| a3 | a2 | a1 | a0 | y1 | y0 | V |
|----|----|----|----|----|----|---|
| 0  | 0  | 0  | 0  | 0  | 0  | 0 |
| 0  | 0  | 0  | 1  | 0  | 0  | 1 |
| 0  | 0  | 1  | x  | 0  | 1  | 1 |
| 0  | 1  | x  | x  | 1  | 0  | 1 |
| 1  | x  | x  | x  | 1  | 1  | 1 |

