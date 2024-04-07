# Verilog Files

SRC_MASTER_ADAPTOR = $(shell pwd)/src/AXI4_Lite_Master_Adaptor.v
TB_MASTER_ADAPTOR = $(shell pwd)/tb/AXI4_Lite_Master_Adaptor_tb.v
VVP_MASTER_ADAPTOR = $(shell pwd)/temp/AXI4_Lite_Master_Adaptor_tb.vvp
VCD_MASTER_ADAPTOR = $(shell pwd)/temp/AXI4_Lite_Master_Adaptor_tb.vcd

SRC_SLAVE_ADAPTOR = $(shell pwd)/src/AXI4_Lite_Slave_Adaptor.v
TB_SLAVE_ADAPTOR = $(shell pwd)/tb/AXI4_Lite_Slave_Adaptor_tb.v
VVP_SLAVE_ADAPTOR = $(shell pwd)/temp/AXI4_Lite_Slave_Adaptor_tb.vvp
VCD_SLAVE_ADAPTOR = $(shell pwd)/temp/AXI4_Lite_Slave_Adaptor_tb.vcd

SRC_ADAPTOR = $(shell pwd)/src/AXI4_Lite_Adaptor.v
TB_ADAPTOR = $(shell pwd)/tb/AXI4_Lite_Adaptor_Test.v
VVP_ADAPTOR = $(shell pwd)/temp/AXI4_Lite_Adaptor_Test.vvp
VCD_ADAPTOR = $(shell pwd)/temp/AXI4_Lite_Adaptor_Test.vcd

SRC_AXI4_LITE = $(shell pwd)/src/AXI4_Lite.v
TB_AXI4_LITE = $(shell pwd)/tb/AXI4_Lite_Test.v
VVP_AXI4_LITE = $(shell pwd)/temp/AXI4_Lite_Test.vvp
VCD_AXI4_LITE = $(shell pwd)/temp/AXI4_Lite_Test.vcd

SRC_AXI4_LITE_CROSSBAR = $(shell pwd)/../AXI4_Lite_Crossbar/src/AXI4_Lite_Crossbar_2x2.v

# Compilation Settings

COMPILER = iverilog
COMPILER_FLAG = -o

# Simulation Settings

SIMULATION_FLAG = vvp

# Target: MAIN

all: axi4_lite

everything: axi4_lite adaptor master_adaptor slave_adaptor

clean: 
	rm -rf temp

# Target: Master Adaptor

master_adaptor: compile_master_adaptor
	$(SIMULATION_FLAG) $(VVP_MASTER_ADAPTOR)

compile_master_adaptor: 
	mkdir -p temp
	$(COMPILER) $(COMPILER_FLAG) $(VVP_MASTER_ADAPTOR) $(TB_MASTER_ADAPTOR) $(SRC_MASTER_ADAPTOR)

clean_master_adaptor: 
	rm -rf $(VCD_MASTER_ADAPTOR)
	rm -rf $(VVP_MASTER_ADAPTOR)

# Target: Slave Adaptor

slave_adaptor: compile_slave_adaptor
	$(SIMULATION_FLAG) $(VVP_SLAVE_ADAPTOR)

compile_slave_adaptor: 
	mkdir -p temp
	$(COMPILER) $(COMPILER_FLAG) $(VVP_SLAVE_ADAPTOR) $(TB_SLAVE_ADAPTOR) $(SRC_SLAVE_ADAPTOR)

clean_slave_adaptor: 
	rm -rf $(VCD_SLAVE_ADAPTOR)
	rm -rf $(VVP_SLAVE_ADAPTOR)

# Target: Adaptor

adaptor: compile_adaptor
	$(SIMULATION_FLAG) $(VVP_ADAPTOR)

compile_adaptor: 
	mkdir -p temp
	$(COMPILER) $(COMPILER_FLAG) $(VVP_ADAPTOR) $(TB_ADAPTOR) $(SRC_ADAPTOR) $(SRC_MASTER_ADAPTOR) $(SRC_SLAVE_ADAPTOR)

clean_adaptor: 
	rm -rf $(VCD_ADAPTOR)
	rm -rf $(VVP_ADAPTOR)

# Target: AXI4_Lite

axi4_lite: compile_axi4_lite
	$(SIMULATION_FLAG) $(VVP_AXI4_LITE)

compile_axi4_lite: 
	mkdir -p temp
	$(COMPILER) $(COMPILER_FLAG) $(VVP_AXI4_LITE) $(TB_AXI4_LITE) $(SRC_AXI4_LITE) $(SRC_MASTER_ADAPTOR) $(SRC_SLAVE_ADAPTOR) $(SRC_AXI4_LITE_CROSSBAR)

clean_axi4_lite: 
	rm -rf $(VCD_AXI4_LITE)
	rm -rf $(VVP_AXI4_LITE)

