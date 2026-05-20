# 4Bit_ALU_Design
# 🔢 4-Bit ALU (Arithmetic Logic Unit)

> A fully functional 4-bit Arithmetic Logic Unit (ALU) built using logic gates — capable of performing arithmetic and logical operations on 4-bit binary numbers.

---

## 📌 What is an ALU?

An **ALU (Arithmetic Logic Unit)** is the brain of a CPU. It performs all the **math** (like addition and subtraction) and **logic** (like AND, OR, NOT) operations inside a computer.

This project implements a **4-bit ALU**, which means it works with 4-bit binary numbers (values from `0000` to `1111`, i.e., 0 to 15 in decimal).

---

## ✨ Features

- ✅ 4-bit binary **Addition**
- ✅ 4-bit binary **Subtraction** (using 2's complement)
- ✅ Bitwise **AND**
- ✅ Bitwise **OR**
- ✅ Bitwise **NOT / Complement**
- ✅ Bitwise **XOR**
- ✅ **Carry Out** flag for overflow detection
- ✅ **Zero flag** — indicates when result is zero

---

## 🧠 How It Works

The ALU takes:

| Input | Description |
|-------|-------------|
| `A [3:0]` | First 4-bit operand |
| `B [3:0]` | Second 4-bit operand |
| `SEL [2:0]` | Operation selector (3-bit control signal) |

And gives:

| Output | Description |
|--------|-------------|
| `Result [3:0]` | 4-bit output of the operation |
| `Carry` | Carry bit (overflow for addition) |
| `Zero` | 1 if result is 0000, else 0 |

### Operation Table

| SEL (Binary) | Operation | Description |
|:---:|:---:|---|
| `000` | A + B | Addition |
| `001` | A - B | Subtraction |
| `010` | A AND B | Bitwise AND |
| `011` | A OR B | Bitwise OR |
| `100` | A XOR B | Bitwise XOR |
| `101` | NOT A | Bitwise complement of A |
| `110` | A << 1 | Left Shift (if implemented) |
| `111` | A >> 1 | Right Shift (if implemented) |

> ⚠️ SEL values may vary based on your specific implementation. Refer to your source code for the exact mapping.

---

## 🛠️ Tools & Technologies Used

- **Hardware Description Language:** Verilog / VHDL *(or whichever you used)*
- **Simulation Tool:** ModelSim / Xilinx ISE / Logisim / Quartus *(edit as needed)*
- **Target Device:** FPGA / Educational Simulation *(edit as needed)*

---

## 📁 Project Structure

```
4-bit-ALU/
│
├── src/
│   ├── alu.v            # Main ALU module
│   ├── adder.v          # 4-bit full adder
│   └── logic_unit.v     # Logic operations module
│
├── testbench/
│   └── alu_tb.v         # Testbench for simulation
│
├── simulation/
│   └── waveform.png     # Output waveform screenshot
│
└── README.md
```

> 📝 Update the folder structure above to match your actual project files.

---

## ▶️ How to Run / Simulate

### Using ModelSim
```bash
# 1. Open ModelSim
# 2. Compile the design
vlog src/alu.v

# 3. Compile the testbench
vlog testbench/alu_tb.v

# 4. Run simulation
vsim alu_tb
run -all
```

### Using Logisim
1. Open Logisim
2. Load the `.circ` file from the `src/` folder
3. Use the input pins to provide values for A, B, and SEL
4. Observe the output on the result pins

---

## 🧪 Example Test Cases

| A (Binary) | B (Binary) | SEL | Operation | Result | Carry |
|:---:|:---:|:---:|:---:|:---:|:---:|
| `0011` (3) | `0101` (5) | `000` | A + B | `1000` (8) | 0 |
| `1111` (15) | `0001` (1) | `000` | A + B | `0000` (0) | 1 |
| `1010` (10) | `0011` (3) | `001` | A - B | `0111` (7) | 0 |
| `1100` | `1010` | `010` | A AND B | `1000` | - |
| `1100` | `1010` | `011` | A OR B | `1110` | - |
| `1111` | - | `101` | NOT A | `0000` | - |

---

# Simulation Output<img width="1907" height="996" alt="ALU output" src="https://github.com/user-attachments/assets/7ac81102-8877-4572-b131-bc839a9cffd4" />
           ALU OUTPUT
<img width="1902" height="894" alt="layout design" src="https://github.com/user-attachments/assets/163ef50e-6cf8-43b5-99cf-6161eceedddc" />
           ALU LAYOUT DESIGN
<img width="1580" height="801" alt="sechmatic design" src="https://github.com/user-attachments/assets/b1f763cc-cfd8-4157-8878-18eaef9d5415" />
           SECHMATIC DESIGN

# Concepts You'll Learn from This Project

1. How binary addition and subtraction works
2.What 2's complement is and how it's used for subtraction
3. How logic gates (AND, OR, XOR, NOT) work in combination
4.How a control signal (SEL) selects between operations
5.How carry and zero flags work in a real CPU

---

# About
This project was built as part of a **Digital Electronics / Computer Organization** course to understand how low-level hardware computation works from the ground up.








> ⭐ If you found this helpful, consider giving the repo a star!
