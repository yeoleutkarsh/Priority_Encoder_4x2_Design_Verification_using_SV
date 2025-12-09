# Priority_Encoder_4x2_Design_Verification_using_SV
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## 1) Introduction:
- A **priority encoder** is a combinational circuit that encodes the highest-priority active input when multiple inputs are active simultaneously.
- Only the **highest-priority active input** is encoded into the output at a time.
- It prevents conflicts that can occur in ordinary encoders when two or more inputs are active at the same time.
- A priority encoder has **2ⁿ input** lines and **n output** lines, where the output represents the binary code of the highest-priority active input.
- Common types include **octal-to-binary**, **decimal-to-BCD**, and **keyboard encoders**.
- **Inputs**: a3, a2, a1, a0 (4 input lines, a3 has the highest priority, a0 has the lowest).
- **Outputs**: y1, y0 (2-bit binary output).
- **Valid (V) signal**: Indicates if any input is active.

### Truth Table
<div align="center">

| a3 | a2 | a1 | a0 | y1 | y0 | V |
|----|----|----|----|----|----|---|
| 0  | 0  | 0  | 0  | 0  | 0  | 0 |
| 0  | 0  | 0  | 1  | 0  | 0  | 1 |
| 0  | 0  | 1  | x  | 0  | 1  | 1 |
| 0  | 1  | x  | x  | 1  | 0  | 1 |
| 1  | x  | x  | x  | 1  | 1  | 1 |

</div>


### Output Equations
<div align="center">
y1 = a3 + a2  <br>
y0 = a3 + (~a2 & a1)  <br>
V  = a3 + a2 + a1 + a0
</div>

## 2) Verification Plan:
- The 4x2 Priority Encoder was verified using a SystemVerilog testbench with assertions, scoreboard checking, and constrained random tests to ensure correct functionality and priority handling across all input combinations.
- Verification Component:
  1. **Design Under Test (DUT)**: pe.sv (Priority Encoder module)
  2. **Assertions**: assertion.sv (Immediate and functional checks for correct output)
  3. **Transaction**: transaction.sv (Defines input stimulus objects)
  4. **Interface**: interface.sv (Connects DUT with testbench)
  5. **Generator**: generator.sv (Random and directed input sequences)
  6. **BFM (Bus Functional Model)**: bfm.sv (Drives inputs to DUT)
  7. **Monitor**: mon.sv (Captures DUT outputs)
  8. **Scoreboard**: sco.sv (Compares DUT outputs against expected values)
  9. **Coverage**: cov.sv (Tracks functional coverage)
  10. **Environment**: env.sv (Instantiates all TB components)
  11. **Testbench:** tb.sv (Implements test scenarios)
  12. **Top-level:** top.sv (Top-level integration of DUT and TB)

## 3) Simulation and Results:
- QuestaSim simulation confirmed the functionality of the 4x2 priority encoder.
- Waveforms and assertions verified that outputs y1, y0, and V matched expected results for all input combinations.
- Scoreboard checks ensured DUT outputs were consistent with expected values.
- Functional coverage validated that all input scenarios, including corner cases, were exercised.
- All tests passed, demonstrating correct priority encoding behavior.

  ### Transcipt Result :-
  <img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/fff054d0-4bfd-40b3-a779-692262a7a187" />

  ### Waveform :-
  <img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/fa7b4a52-5488-447c-8b2e-45bc9692d234" />

  ### Coverage Result :-
  <img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/87584527-38b2-4177-a74a-9f03a4996c51" />

  ### Assertion Result :-
  <img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/515b134b-5999-4815-a31a-54279fef17c2" />



