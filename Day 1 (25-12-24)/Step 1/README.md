# UVM Learning Example

This repository contains a basic example of using UVM (Universal Verification Methodology) in SystemVerilog. The example demonstrates the use of UVM macros, class definitions, and simple simulation components. It is structured into three main parts: a simple module, a UVM package, and a module that interacts with the package.

## Files Overview

### 1. `hello.sv`
This is a simple SystemVerilog module that demonstrates basic output using the `$display` function.

- **Purpose**: Prints a simple message to the console.
- **Key Points**:
  - Uses `$display` to print "Hello, Welcome to My Git Hub in Learning UVM".
  - The module doesn't interact with UVM macros or packages.

### 2. `package_1.sv`
This file defines a UVM package and a class that uses UVM macros.

- **Purpose**: Defines a UVM package `pkg_1` containing a class `package_1` that demonstrates basic UVM logging.
- **Key Points**:
  - Imports the UVM package `uvm_pkg`.
  - The class `package_1` contains a constructor that:
    - Displays a simple message "ABC" using `$display`.
    - Logs a message using the UVM macro `\`uvm_info` with severity level `UVM_NONE`.

### 3. `class_2.sv`
This module demonstrates how to instantiate the class from `package_1` and use UVM logging.

- **Purpose**: Shows how to use the `package_1` class in a module and log information using UVM.
- **Key Points**:
  - Imports the UVM package `uvm_pkg` and the `pkg_1` package.
  - Instantiates the `package_1` class and assigns a value to the `data_1` variable using the macro `DATA`.
  - Logs the value of `data_1` using the UVM macro `\`uvm_info` with severity level `UVM_LOW`.

### Key Concepts Demonstrated:
- **UVM Macros**: Usage of `\`uvm_info` for structured logging with severity levels.
- **SystemVerilog Display**: Using `$display` for simple console output.
- **UVM Package and Class**: How to define and instantiate UVM classes within a package.
- **Simulation Initialization**: Using the `initial` block to execute code at the start of simulation.

## How to Run
1. Ensure you have a UVM-compliant simulator (e.g., Mentor Graphics Questa, Synopsys VCS, Cadence Xcelium).
2. Compile the files in the correct order:
   - `hello.sv`
   - `package_1.sv`
   - `class_2.sv`
3. Run the simulation.

## Output
- The `hello.sv` module will print a simple message:  
  `Hello, Welcome to My Git Hub in Learning UVM`
- The `package_1.sv` class will log the message:  
  `This is importing uvm pkg from uvm macros`
- The `class_2.sv` module will log:  
  `data_1 is 1`

## License
This repository is for educational purposes. Feel free to clone and modify it for your learning.
