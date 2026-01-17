# ARM-Assembly
Here is some of the work I did using ARM while learning assembly for 4 months.

# Description:
This file contains many short ARM assembly experiments covering addressing modes, data access (byte/word), stack operations, multiple-register store/load, conditional execution, simple algorithms (Greatest Common Denominator), and small data-layout examples. These snippets show hands-on experience with low-level programming, memory and register manipulation, and ARM instruction set features useful for embedded/firmware and systems roles.

Simple addressing / data example (top commented block)

Demonstrates use of register immediate moves, LDRB with complex addressing (post-index and shifted register/ASR), shifted add (LSL in ADD) and inline data bytes (DCB). Shows knowledge of addressing modes and data definitions.

ADR / LDR / LSL example (short commented block)

Simple example showing loading an address into a register (LDR =label / ADR) and performing a logical shift left (LSL). Illustrates use of address literals and shifts.

GCD (Euclidean algorithm) (commented block labeled GCD)

Implements the Euclidean Greatest Common Denominator by repeated subtraction with conditional instructions (CMP, SUBLT, SUBGT, BNE). Demonstrates algorithmic control flow and conditional execution.

Conditional LDRB example (single instruction)

Shows a conditional (PL) byte-load with post-indexing and shifted register offset (LDRBPL [r5], r6, LSL #7). Demonstrates conditional execution and complex addressing.

ADR/LDRB with various addressing modes + data labels (ADR R0,C+1 block)

Exercises ADR to compute addresses and several LDRB addressing forms (offset, post-index with negative register and shift, and writeback). Paired with data labels (DCB/DCD) to show byte/word data layout in memory.

Stack push/pop example (PUSH_R0 / POP_R0)

Demonstrates setting SP from a label and explicit push/pop using STR with pre-decrement and LDR with post-increment to implement stack push/pop; includes stack allocation (SPACE/DCD). Shows manual stack manipulation and calling/return style memory management.

String-copy with skip of "the" (long commented block with START/START3/STOP)

Copies characters from STRING1 to STRING2 while detecting and skipping the substring "the" when it appears as a standalone word (checks surrounding spaces / end-of-string). Demonstrates byte loads/stores, string scanning, branching, and conditional logic.

Store/Load multiple / PC store example(s) (two similar blocks)

Shows STM/LDM variants that store or load the PC and other registers to/from memory (STMEA, STR PC, LDMFA), and how to lay out and read data words. Demonstrates multiple-register store/load instructions and using PC as data.

Stack test examples (two variants named StackTest1)

Two snippets that set up a stack, STM* to push multiple registers, change registers, then LDM* to pop a subset back — showing different addressing modes (STMFD/STMED/LDMED/LDMFD) and register ordering behavior. Good for demonstrating low-level stack frame and multiple-register transfer semantics.

Final active program (bottom of file)

Practical demonstration of storing the PC and other words into memory at a label (AAA), then loading two words back into registers (LDMFA), followed by an infinite loop — effectively a concise demo of STMEA/STR/LDMFA and data layout. Shows use of ADR, PC manipulation, and multiple-load/store instructions.

