# Verilog Files

SRC_HANDSHAKING_CROSSBAR = $(shell pwd)/src/Handshaking_Crossbar_2x2.v
TB_HANDSHAKING_CROSSBAR = $(shell pwd)/tb/Handshaking_Crossbar_2x2_tb.v
VVP_HANDSHAKING_CROSSBAR = $(shell pwd)/temp/Handshaking_Crossbar_2x2_tb.vvp
VCD_HANDSHAKING_CROSSBAR = $(shell pwd)/temp/Handshaking_Crossbar_2x2_tb.vcd

# Compilation Settings

COMPILER = iverilog
COMPILER_FLAG = -o

# Simulation Settings

SIMULATION_FLAG = vvp

# Target: MAIN

all: handshaking_crossbar

everything: handshaking_crossbar

clean: 
	rm -rf temp

# Target: Handshaking Crossbar 2x2

handshaking_crossbar: compile_handshaking_crossbar
	$(SIMULATION_FLAG) $(VVP_HANDSHAKING_CROSSBAR)

compile_handshaking_crossbar: 
	mkdir -p temp
	$(COMPILER) $(COMPILER_FLAG) $(VVP_HANDSHAKING_CROSSBAR) $(TB_HANDSHAKING_CROSSBAR) $(SRC_HANDSHAKING_CROSSBAR)

clean_handshaking_crossbar: 
	rm -rf $(VCD_HANDSHAKING_CROSSBAR)
	rm -rf $(VVP_HANDSHAKING_CROSSBAR)

