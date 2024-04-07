# Verilog Files

SRC_AXI4_LITE_CROSSBAR = $(shell pwd)/src/AXI4_Lite_Crossbar_2x2.v
TB_AXI4_LITE_CROSSBAR = $(shell pwd)/tb/AXI4_Lite_Crossbar_2x2_tb.v
VVP_AXI4_LITE_CROSSBAR = $(shell pwd)/temp/AXI4_Lite_Crossbar_2x2_tb.vvp
VCD_AXI4_LITE_CROSSBAR = $(shell pwd)/temp/AXI4_Lite_Crossbar_2x2_tb.vcd

# Compilation Settings

COMPILER = iverilog
COMPILER_FLAG = -o

# Simulation Settings

SIMULATION_FLAG = vvp

# Target: MAIN

all: axi4_lite_crossbar

everything: axi4_lite_crossbar

clean: 
	rm -rf temp

# Target: AXI4 Lite Crossbar 2x2

axi4_lite_crossbar: compile_axi4_lite_crossbar
	$(SIMULATION_FLAG) $(VVP_AXI4_LITE_CROSSBAR)

compile_axi4_lite_crossbar: 
	mkdir -p temp
	$(COMPILER) $(COMPILER_FLAG) $(VVP_AXI4_LITE_CROSSBAR) $(TB_AXI4_LITE_CROSSBAR) $(SRC_AXI4_LITE_CROSSBAR)

clean_axi4_lite_crossbar: 
	rm -rf $(VCD_AXI4_LITE_CROSSBAR)
	rm -rf $(VVP_AXI4_LITE_CROSSBAR)

