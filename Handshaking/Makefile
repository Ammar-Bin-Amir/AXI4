# Verilog Files

SRC_MASTER = $(shell pwd)/src/Handshaking_Master.v
TB_MASTER = $(shell pwd)/tb/Handshaking_Master_tb.v
VVP_MASTER = $(shell pwd)/temp/Handshaking_Master_tb.vvp
VCD_MASTER = $(shell pwd)/temp/Handshaking_Master_tb.vcd

SRC_SLAVE = $(shell pwd)/src/Handshaking_Slave.v
TB_SLAVE = $(shell pwd)/tb/Handshaking_Slave_tb.v
VVP_SLAVE = $(shell pwd)/temp/Handshaking_Slave_tb.vvp
VCD_SLAVE = $(shell pwd)/temp/Handshaking_Slave_tb.vcd

SRC_HANDSHAKING = $(shell pwd)/src/Handshaking.v
TB_HANDSHAKING = $(shell pwd)/tb/Handshaking_tb.v
VVP_HANDSHAKING = $(shell pwd)/temp/Handshaking_tb.vvp
VCD_HANDSHAKING = $(shell pwd)/temp/Handshaking_tb.vcd

# Compilation Settings

COMPILER = iverilog
COMPILER_FLAG = -o

# Simulation Settings

SIMULATION_FLAG = vvp

# Target: MAIN

all: handshaking

everything: handshaking master slave

clean: 
	rm -rf temp

# Target: Master Adaptor

master: compile_master
	$(SIMULATION_FLAG) $(VVP_MASTER)

compile_master: 
	mkdir -p temp
	$(COMPILER) $(COMPILER_FLAG) $(VVP_MASTER) $(TB_MASTER) $(SRC_MASTER)

clean_master: 
	rm -rf $(VCD_MASTER)
	rm -rf $(VVP_MASTER)

# Target: Slave Adaptor

slave: compile_slave
	$(SIMULATION_FLAG) $(VVP_SLAVE)

compile_slave: 
	mkdir -p temp
	$(COMPILER) $(COMPILER_FLAG) $(VVP_SLAVE) $(TB_SLAVE) $(SRC_SLAVE)

clean_slave: 
	rm -rf $(VCD_SLAVE)
	rm -rf $(VVP_SLAVE)

# Target: Handshaking

handshaking: compile_handshaking
	$(SIMULATION_FLAG) $(VVP_HANDSHAKING)

compile_handshaking: 
	mkdir -p temp
	$(COMPILER) $(COMPILER_FLAG) $(VVP_HANDSHAKING) $(TB_HANDSHAKING) $(SRC_HANDSHAKING) $(SRC_MASTER) $(SRC_SLAVE)

clean_handshaking: 
	rm -rf $(VCD_HANDSHAKING)
	rm -rf $(VVP_HANDSHAKING)

