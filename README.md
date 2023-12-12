# AXI4

This repository consists of hardware designs of handshaking communication principle, AXI4-Lite bus protocol and AXI4 bus protocol. All of these were pre-requisites of the preceding one.

## Handshaking Communication Principle

Handshaking in the context of digital communication refers to the process by which two devices or entities establish communication by exchanging predefined signals or messages to synchronize and agree upon the start, continuation, or completion of a data transfer or operation. Handshaking in digital communication involves signals like 'valid' and 'ready' to synchronize data transfer. 'Valid' signifies the availability of valid data, while 'ready' signals readiness to accept data. These signals coordinate the exchange, ensuring data integrity and synchronized communication between sender and receiver.

## AXI4-Lite Bus Protocol

AXI4-Lite, is a simplified variant of the AXI4 protocol. It is tailored for simpler peripherals and systems where resource usage and complexity need to be minimized. AXI4-Lite offers reduced features and a simpler interface compared to AXI4. While it lacks some of the advanced capabilities of AXI4, such as burst transfers and out-of-order completion, AXI4-Lite provides a lightweight solution for systems with basic communication needs. It is ideal for peripherals requiring a straightforward interface, low gate count, and minimal complexity.

## AXI4 Bus Protocol

AXI4 (Advanced eXtensible Interface 4) is a high-performance, feature-rich protocol designed for complex System-on-Chip (SoC) architectures. It offers advanced features like burst transfers, out-of-order transaction completion, multiple outstanding transactions, and support for high-bandwidth requirements. AXI4 provides a robust framework for communication between various components within an SoC, facilitating efficient data transfers between masters (e.g., processors) and slaves (e.g., memory, peripherals) while ensuring low-latency and high-throughput operations.

## References

- [Rules for Ready/Valid Handshakes](http://fpgacpu.ca/fpga/handshake.html)
- [AMBA AXI and ACE Protocol Specification AXI3, AXI4, and AXI4-Lite ACE and ACE-Lite](http://www.gstitt.ece.ufl.edu/courses/fall15/eel4720_5721/labs/refs/AXI4_specification.pdf)
- [AXI4-Lite Interface](https://www.realdigital.org/doc/a9fee931f7a172423e1ba73f66ca4081)
