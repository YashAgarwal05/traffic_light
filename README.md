# Traffic Light Controller (Verilog)

## Introduction

A **Traffic Light Controller** is a digital control system used to manage traffic flow at road intersections by controlling signal lights for different directions. It ensures safe and orderly movement of vehicles by following a predefined sequence and timing.

In this project, a **traffic light controller** is implemented using **Verilog HDL**. The design controls traffic signals for **North–South (NS)** and **East–West (EW)** directions using a **Finite State Machine (FSM)** and a timing counter.

---

## Traffic Light Operation and Timing

The traffic light controller operates synchronously with the system clock.  
Each traffic state remains active for a fixed number of clock cycles, controlled by an internal counter.

The design uses four states:

- **State A**: NS Green, EW Red  
- **State B**: NS Yellow, EW Red  
- **State C**: NS Red, EW Green  
- **State D**: NS Red, EW Yellow  

State transitions occur only when the counter reaches a predefined value.

---

## Light Sequence Flow

The traffic light follows this sequence:

1. **State A (NS Green, EW Red)**
   - Active for 5 clock counts
   - Transitions to State B

2. **State B (NS Yellow, EW Red)**
   - Active for 2 clock counts
   - Transitions to State C

3. **State C (NS Red, EW Green)**
   - Active for 5 clock counts
   - Transitions to State D

4. **State D (NS Red, EW Yellow)**
   - Active for 2 clock counts
   - Transitions back to State A

This completes one full traffic light cycle.

---

## Design Overview

The traffic light controller is implemented using the following components:

- **Finite State Machine (FSM)**
- **Next-State Combinational Logic**
- **State Register**
- **Timing Counter**
- **Output Control Logic**

The FSM controls the traffic light sequence, while the counter determines how long each state remains active.

---

## Traffic Light Controller Module

### Interface Signals

- **clk**  
  System clock input

- **NS [2:0]**  
  Output signals controlling North–South traffic lights

- **EW [2:0]**  
  Output signals controlling East–West traffic lights

- **state**  
  Current FSM state

- **nextstate**  
  Next FSM state

- **count**  
  Counter used to control state duration

---

## FSM Operation

- The FSM starts in **State A**.
- On every rising edge of the clock:
  - If `state` equals `nextstate`, the counter increments
  - If a state transition occurs, the counter resets to zero
- The next state is determined based on:
  - Current state
  - Counter value

This ensures precise timing for each traffic light phase.

---

## Output Logic

The traffic light outputs are generated based on the current state:

- **State A**  
  - NS = Green  
  - EW = Red  

- **State B**  
  - NS = Yellow  
  - EW = Red  

- **State C**  
  - NS = Red  
  - EW = Green  

- **State D**  
  - NS = Red  
  - EW = Yellow  

Only one direction has a green or yellow signal at any time, preventing traffic conflicts.

---

## Testbench Overview

A Verilog testbench is used to verify the functionality of the traffic light controller.

### Testbench Features

- Generates a periodic clock signal
- Allows the FSM to cycle through all traffic states
- Observes state transitions, counter values, and output signals
- Runs long enough to validate multiple traffic cycles

The testbench confirms correct sequencing and timing behavior.

---

## Overall System Operation

1. The controller starts in State A.
2. The counter increments on each clock cycle.
3. State transitions occur when the counter reaches its limit.
4. NS and EW traffic signals update according to the current state.
5. The sequence repeats continuously.

This confirms correct FSM-based traffic light control.

---

## Summary

This project demonstrates a **Traffic Light Controller using a Finite State Machine** in Verilog. The design correctly sequences traffic signals for North–South and East–West directions using a counter-based timing mechanism.

The structured FSM approach makes the design easy to understand, simulate, and extend for real-world traffic control applications.

<img width="1575" height="809" alt="Screenshot 2025-12-17 173305" src="https://github.com/user-attachments/assets/9c878af2-79b8-45c6-b375-afd62d71f7c2" />
