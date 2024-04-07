`timescale 1ns/1ns

module axi4_lite_crossbar_2x2_tb;
    
    reg aclk;
    reg aresetn;
    // Write Address Channel
    // Master 1
    reg [31:0] awaddr_out_m1;
    reg [2:0] awprot_out_m1;
    reg awvalid_out_m1;
    wire awready_in_m1;
    // Master 2
    reg [31:0] awaddr_out_m2;
    reg [2:0] awprot_out_m2;
    reg awvalid_out_m2;
    wire awready_in_m2;
    // Slave 1
    wire [31:0] awaddr_in_s1;
    wire [2:0] awprot_in_s1;
    wire awvalid_in_s1;
    reg awready_out_s1;
    // Slave 2
    wire [31:0] awaddr_in_s2;
    wire [2:0] awprot_in_s2;
    wire awvalid_in_s2;
    reg awready_out_s2;
    // Write Data Channel
    // Master 1
    reg [31:0] wdata_out_m1;
    reg [3:0] wstrb_out_m1;
    reg wvalid_out_m1;
    wire wready_in_m1;
    // Master 2
    reg [31:0] wdata_out_m2;
    reg [3:0] wstrb_out_m2;
    reg wvalid_out_m2;
    wire wready_in_m2;
    // Slave 1
    wire [31:0] wdata_in_s1;
    wire [3:0] wstrb_in_s1;
    wire wvalid_in_s1;
    reg wready_out_s1;
    // Slave 2
    wire [31:0] wdata_in_s2;
    wire [3:0] wstrb_in_s2;
    wire wvalid_in_s2;
    reg wready_out_s2;
    // Write Response Channel
    // Master 1
    wire [1:0] bresp_in_m1;
    wire bvalid_in_m1;
    reg bready_out_m1;
    // Master 2
    wire [1:0] bresp_in_m2;
    wire bvalid_in_m2;
    reg bready_out_m2;
    // Slave 1
    reg [1:0] bresp_out_s1;
    reg bvalid_out_s1;
    wire bready_in_s1;
    // Slave 2
    reg [1:0] bresp_out_s2;
    reg bvalid_out_s2;
    wire bready_in_s2;
    // Read Address Channel
    // Master 1
    reg [31:0] araddr_out_m1;
    reg [2:0] arprot_out_m1;
    reg arvalid_out_m1;
    wire arready_in_m1;
    // Master 2
    reg [31:0] araddr_out_m2;
    reg [2:0] arprot_out_m2;
    reg arvalid_out_m2;
    wire arready_in_m2;
    // Slave 1
    wire [31:0] araddr_in_s1;
    wire [2:0] arprot_in_s1;
    wire arvalid_in_s1;
    reg arready_out_s1;
    // Slave 2
    wire [31:0] araddr_in_s2;
    wire [2:0] arprot_in_s2;
    wire arvalid_in_s2;
    reg arready_out_s2;
    // Read Data Channel
    // Master 1
    wire [31:0] rdata_in_m1;
    wire rvalid_in_m1;
    reg rready_out_m1;
    wire [1:0] rresp_in_m1;
    // Master 2
    wire [31:0] rdata_in_m2;
    wire rvalid_in_m2;
    reg rready_out_m2;
    wire [1:0] rresp_in_m2;
    // Slave 1
    reg [31:0] rdata_out_s1;
    reg rvalid_out_s1;
    wire rready_in_s1;
    reg [1:0] rresp_out_s1;
    // Slave 2
    reg [31:0] rdata_out_s2;
    reg rvalid_out_s2;
    wire rready_in_s2;
    reg [1:0] rresp_out_s2;

    axi4_lite_crossbar_2x2 uut(
        aclk, aresetn,
        // Write Address Channel
        awaddr_out_m1, awprot_out_m1, awvalid_out_m1, awready_in_m1,
        awaddr_out_m2, awprot_out_m2, awvalid_out_m2, awready_in_m2,
        awaddr_in_s1, awprot_in_s1, awvalid_in_s1, awready_out_s1,
        awaddr_in_s2, awprot_in_s2, awvalid_in_s2, awready_out_s2,
        // Write Data Channel
        wdata_out_m1, wstrb_out_m1, wvalid_out_m1, wready_in_m1,
        wdata_out_m2, wstrb_out_m2, wvalid_out_m2, wready_in_m2,
        wdata_in_s1, wstrb_in_s1, wvalid_in_s1, wready_out_s1,
        wdata_in_s2, wstrb_in_s2, wvalid_in_s2, wready_out_s2,
        // Write Response Channel
        bresp_in_m1, bvalid_in_m1, bready_out_m1,
        bresp_in_m2, bvalid_in_m2, bready_out_m2,
        bresp_out_s1, bvalid_out_s1, bready_in_s1,
        bresp_out_s2, bvalid_out_s2, bready_in_s2,
        // Read Address Channel
        araddr_out_m1, arprot_out_m1, arvalid_out_m1, arready_in_m1,
        araddr_out_m2, arprot_out_m2, arvalid_out_m2, arready_in_m2,
        araddr_in_s1, arprot_in_s1, arvalid_in_s1, arready_out_s1,
        araddr_in_s2, arprot_in_s2, arvalid_in_s2, arready_out_s2,
        // Read Data Channel
        rdata_in_m1, rvalid_in_m1, rready_out_m1, rresp_in_m1,
        rdata_in_m2, rvalid_in_m2, rready_out_m2, rresp_in_m2,
        rdata_out_s1, rvalid_out_s1, rready_in_s1, rresp_out_s1,
        rdata_out_s2, rvalid_out_s2, rready_in_s2, rresp_out_s2
    );

    initial begin
        $dumpfile("./temp/AXI4_Lite_Crossbar_2x2_tb.vcd");
        $dumpvars(0,axi4_lite_crossbar_2x2_tb);
    end

    initial aclk = 0;
    always #5 aclk = ~aclk;

    initial begin
        aresetn = 0;
        #10 aresetn = 1;
        // M1 ---> S1
        #30
        awaddr_out_m1 = 32'h0000_2000; awprot_out_m1 = 0; awvalid_out_m1 = 1; awready_out_s1 = 1;
        wdata_out_m1 = 0; wstrb_out_m1 = 0; wvalid_out_m1 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m1 = 1;
        araddr_out_m1 = 32'h0000_2001; arprot_out_m1 = 2; arvalid_out_m1 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 1; rvalid_out_s1 = 1; rready_out_m1 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m1 = 32'h0000_2002; awprot_out_m1 = 2; awvalid_out_m1 = 0; awready_out_s1 = 0;
        wdata_out_m1 = 2; wstrb_out_m1 = 2; wvalid_out_m1 = 0; wready_out_s1 = 0;
        bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m1 = 0;
        araddr_out_m1 = 32'h0000_2003; arprot_out_m1 = 4; arvalid_out_m1 = 0; arready_out_s1 = 0;
        rdata_out_s1 = 3; rvalid_out_s1 = 0; rready_out_m1 = 0; rresp_out_s1 = 0;
        #30
        awaddr_out_m1 = 32'h0000_2004; awprot_out_m1 = 4; awvalid_out_m1 = 1; awready_out_s1 = 1;
        wdata_out_m1 = 4; wstrb_out_m1 = 4; wvalid_out_m1 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m1 = 1;
        araddr_out_m1 = 32'h0000_2005; arprot_out_m1 = 6; arvalid_out_m1 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 5; rvalid_out_s1 = 1; rready_out_m1 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m1 = 32'h0000_0006; awprot_out_m1 = 0; awvalid_out_m1 = 0; awready_out_s1 = 0;
        wdata_out_m1 = 6; wstrb_out_m1 = 6; wvalid_out_m1 = 0; wready_out_s1 = 0;
        bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m1 = 0;
        araddr_out_m1 = 32'h0000_1007; arprot_out_m1 = 6; arvalid_out_m1 = 0; arready_out_s1 = 0;
        rdata_out_s1 = 7; rvalid_out_s1 = 0; rready_out_m1 = 0; rresp_out_s1 = 0;
        // M1 ---> S2
        #30
        awaddr_out_m1 = 32'h0000_3008; awprot_out_m1 = 1; awvalid_out_m1 = 1; awready_out_s2 = 1;
        wdata_out_m1 = 8; wstrb_out_m1 = 1; wvalid_out_m1 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m1 = 1;
        araddr_out_m1 = 32'h0000_3009; arprot_out_m1 = 3; arvalid_out_m1 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 9; rvalid_out_s2 = 1; rready_out_m1 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m1 = 32'h0000_300a; awprot_out_m1 = 3; awvalid_out_m1 = 0; awready_out_s2 = 0;
        wdata_out_m1 = 10; wstrb_out_m1 = 3; wvalid_out_m1 = 0; wready_out_s2 = 0;
        bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m1 = 0;
        araddr_out_m1 = 32'h0000_300b; arprot_out_m1 = 5; arvalid_out_m1 = 0; arready_out_s2 = 0;
        rdata_out_s2 = 11; rvalid_out_s2 = 0; rready_out_m1 = 0; rresp_out_s2 = 0;
        #30
        awaddr_out_m1 = 32'h0000_300c; awprot_out_m1 = 5; awvalid_out_m1 = 1; awready_out_s2 = 1;
        wdata_out_m1 = 12; wstrb_out_m1 = 5; wvalid_out_m1 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m1 = 1;
        araddr_out_m1 = 32'h0000_300d; arprot_out_m1 = 7; arvalid_out_m1 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 13; rvalid_out_s2 = 1; rready_out_m1 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m1 = 32'h0000_400e; awprot_out_m1 = 1; awvalid_out_m1 = 0; awready_out_s2 = 0;
        wdata_out_m1 = 14; wstrb_out_m1 = 7; wvalid_out_m1 = 0; wready_out_s2 = 0;
        bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m1 = 0;
        araddr_out_m1 = 32'h0000_500f; arprot_out_m1 = 7; arvalid_out_m1 = 0; arready_out_s2 = 0;
        rdata_out_s2 = 15; rvalid_out_s2 = 0; rready_out_m1 = 0; rresp_out_s2 = 0;
        // M2 ---> S1
        #30
        awaddr_out_m2 = 32'h0000_2010; awprot_out_m2 = 0; awvalid_out_m2 = 1; awready_out_s1 = 1;
        wdata_out_m2 = 16; wstrb_out_m2 = 0; wvalid_out_m2 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m2 = 1;
        araddr_out_m2 = 32'h0000_2011; arprot_out_m2 = 2; arvalid_out_m2 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 17; rvalid_out_s1 = 1; rready_out_m2 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m2 = 32'h0000_2012; awprot_out_m2 = 2; awvalid_out_m2 = 0; awready_out_s1 = 0;
        wdata_out_m2 = 18; wstrb_out_m2 = 2; wvalid_out_m2 = 0; wready_out_s1 = 0;
        bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m2 = 0;
        araddr_out_m2 = 32'h0000_2013; arprot_out_m2 = 4; arvalid_out_m2 = 0; arready_out_s1 = 0;
        rdata_out_s1 = 19; rvalid_out_s1 = 0; rready_out_m2 = 0; rresp_out_s1 = 0;
        #30
        awaddr_out_m2 = 32'h0000_2014; awprot_out_m2 = 4; awvalid_out_m2 = 1; awready_out_s1 = 1;
        wdata_out_m2 = 20; wstrb_out_m2 = 4; wvalid_out_m2 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m2 = 1;
        araddr_out_m2 = 32'h0000_2015; arprot_out_m2 = 6; arvalid_out_m2 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 21; rvalid_out_s1 = 1; rready_out_m2 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m2 = 32'h0000_6016; awprot_out_m2 = 0; awvalid_out_m2 = 0; awready_out_s1 = 0;
        wdata_out_m2 = 22; wstrb_out_m2 = 6; wvalid_out_m2 = 0; wready_out_s1 = 0;
        bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m2 = 0;
        araddr_out_m2 = 32'h0000_7017; arprot_out_m2 = 6; arvalid_out_m2 = 0; arready_out_s1 = 0;
        rdata_out_s1 = 23; rvalid_out_s1 = 0; rready_out_m2 = 0; rresp_out_s1 = 0;
        // M2 ---> S2
        #30
        awaddr_out_m2 = 32'h0000_3018; awprot_out_m2 = 1; awvalid_out_m2 = 1; awready_out_s2 = 1;
        wdata_out_m2 = 24; wstrb_out_m2 = 1; wvalid_out_m2 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m2 = 1;
        araddr_out_m2 = 32'h0000_3019; arprot_out_m2 = 3; arvalid_out_m2 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 25; rvalid_out_s2 = 1; rready_out_m2 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m2 = 32'h0000_301a; awprot_out_m2 = 3; awvalid_out_m2 = 0; awready_out_s2 = 0;
        wdata_out_m2 = 26; wstrb_out_m2 = 3; wvalid_out_m2 = 0; wready_out_s2 = 0;
        bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m2 = 0;
        araddr_out_m2 = 32'h0000_301b; arprot_out_m2 = 5; arvalid_out_m2 = 0; arready_out_s2 = 0;
        rdata_out_s2 = 27; rvalid_out_s2 = 0; rready_out_m2 = 0; rresp_out_s2 = 0;
        #30
        awaddr_out_m2 = 32'h0000_301c; awprot_out_m2 = 5; awvalid_out_m2 = 1; awready_out_s2 = 1;
        wdata_out_m2 = 28; wstrb_out_m2 = 5; wvalid_out_m2 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m2 = 1;
        araddr_out_m2 = 32'h0000_301d; arprot_out_m2 = 7; arvalid_out_m2 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 29; rvalid_out_s2 = 1; rready_out_m2 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m2 = 32'h0000_801e; awprot_out_m2 = 1; awvalid_out_m2 = 0; awready_out_s2 = 0;
        wdata_out_m2 = 30; wstrb_out_m2 = 7; wvalid_out_m2 = 0; wready_out_s2 = 0;
        bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m2 = 0;
        araddr_out_m2 = 32'h0000_901f; arprot_out_m2 = 7; arvalid_out_m2 = 0; arready_out_s2 = 0;
        rdata_out_s2 = 31; rvalid_out_s2 = 0; rready_out_m2 = 0; rresp_out_s2 = 0;
        // M1 ---> S1 & M2 ---> S2
        #30
        awaddr_out_m1 = 32'h0000_2020; awprot_out_m1 = 0; awvalid_out_m1 = 1; awready_out_s1 = 1;
        wdata_out_m1 = 32; wstrb_out_m1 = 0; wvalid_out_m1 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m1 = 1;
        araddr_out_m1 = 32'h0000_2021; arprot_out_m1 = 2; arvalid_out_m1 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 33; rvalid_out_s1 = 1; rready_out_m1 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m2 = 32'h0000_3028; awprot_out_m2 = 1; awvalid_out_m2 = 1; awready_out_s2 = 1;
        wdata_out_m2 = 40; wstrb_out_m2 = 1; wvalid_out_m2 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m2 = 1;
        araddr_out_m2 = 32'h0000_3029; arprot_out_m2 = 3; arvalid_out_m2 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 41; rvalid_out_s2 = 1; rready_out_m2 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m1 = 32'h0000_2022; awprot_out_m1 = 2; awvalid_out_m1 = 0; awready_out_s1 = 0;
        wdata_out_m1 = 34; wstrb_out_m1 = 2; wvalid_out_m1 = 0; wready_out_s1 = 0;
        bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m1 = 0;
        araddr_out_m1 = 32'h0000_2023; arprot_out_m1 = 4; arvalid_out_m1 = 0; arready_out_s1 = 0;
        rdata_out_s1 = 35; rvalid_out_s1 = 0; rready_out_m1 = 0; rresp_out_s1 = 0;
        #30
        awaddr_out_m2 = 32'h0000_302a; awprot_out_m2 = 3; awvalid_out_m2 = 0; awready_out_s2 = 0;
        wdata_out_m2 = 42; wstrb_out_m2 = 3; wvalid_out_m2 = 0; wready_out_s2 = 0;
        bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m2 = 0;
        araddr_out_m2 = 32'h0000_302b; arprot_out_m2 = 5; arvalid_out_m2 = 0; arready_out_s2 = 0;
        rdata_out_s2 = 43; rvalid_out_s2 = 0; rready_out_m2 = 0; rresp_out_s2 = 0;
        #30
        awaddr_out_m1 = 32'h0000_2024; awprot_out_m1 = 4; awvalid_out_m1 = 1; awready_out_s1 = 1;
        wdata_out_m1 = 36; wstrb_out_m1 = 4; wvalid_out_m1 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m1 = 1;
        araddr_out_m1 = 32'h0000_2025; arprot_out_m1 = 6; arvalid_out_m1 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 37; rvalid_out_s1 = 1; rready_out_m1 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m2 = 32'h0000_302c; awprot_out_m2 = 5; awvalid_out_m2 = 1; awready_out_s2 = 1;
        wdata_out_m2 = 44; wstrb_out_m2 = 5; wvalid_out_m2 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m2 = 1;
        araddr_out_m2 = 32'h0000_302d; arprot_out_m2 = 7; arvalid_out_m2 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 45; rvalid_out_s2 = 1; rready_out_m2 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m1 = 32'h0000_0026; awprot_out_m1 = 0; awvalid_out_m1 = 0; awready_out_s1 = 0;
        wdata_out_m1 = 38; wstrb_out_m1 = 6; wvalid_out_m1 = 0; wready_out_s1 = 0;
        bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m1 = 0;
        araddr_out_m1 = 32'h0000_1027; arprot_out_m1 = 6; arvalid_out_m1 = 0; arready_out_s1 = 0;
        rdata_out_s1 = 39; rvalid_out_s1 = 0; rready_out_m1 = 0; rresp_out_s1 = 0;
        #30
        awaddr_out_m2 = 32'h0000_802e; awprot_out_m2 = 1; awvalid_out_m2 = 0; awready_out_s2 = 0;
        wdata_out_m2 = 46; wstrb_out_m2 = 7; wvalid_out_m2 = 0; wready_out_s2 = 0;
        bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m2 = 0;
        araddr_out_m2 = 32'h0000_902f; arprot_out_m2 = 7; arvalid_out_m2 = 0; arready_out_s2 = 0;
        rdata_out_s2 = 47; rvalid_out_s2 = 0; rready_out_m2 = 0; rresp_out_s2 = 0;
        // M1 ---> S2 & M2 ---> S1
        #30
        awaddr_out_m1 = 32'h0000_3030; awprot_out_m1 = 1; awvalid_out_m1 = 1; awready_out_s2 = 1;
        wdata_out_m1 = 48; wstrb_out_m1 = 1; wvalid_out_m1 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m1 = 1;
        araddr_out_m1 = 32'h0000_3031; arprot_out_m1 = 3; arvalid_out_m1 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 49; rvalid_out_s2 = 1; rready_out_m1 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m2 = 32'h0000_2038; awprot_out_m2 = 0; awvalid_out_m2 = 1; awready_out_s1 = 1;
        wdata_out_m2 = 56; wstrb_out_m2 = 0; wvalid_out_m2 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m2 = 1;
        araddr_out_m2 = 32'h0000_2039; arprot_out_m2 = 2; arvalid_out_m2 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 57; rvalid_out_s1 = 1; rready_out_m2 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m1 = 32'h0000_3032; awprot_out_m1 = 3; awvalid_out_m1 = 0; awready_out_s2 = 0;
        wdata_out_m1 = 50; wstrb_out_m1 = 3; wvalid_out_m1 = 0; wready_out_s2 = 0;
        bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m1 = 0;
        araddr_out_m1 = 32'h0000_3033; arprot_out_m1 = 5; arvalid_out_m1 = 0; arready_out_s2 = 0;
        rdata_out_s2 = 51; rvalid_out_s2 = 0; rready_out_m1 = 0; rresp_out_s2 = 0;
        #30
        awaddr_out_m2 = 32'h0000_204a; awprot_out_m2 = 2; awvalid_out_m2 = 0; awready_out_s1 = 0;
        wdata_out_m2 = 58; wstrb_out_m2 = 2; wvalid_out_m2 = 0; wready_out_s1 = 0;
        bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m2 = 0;
        araddr_out_m2 = 32'h0000_204b; arprot_out_m2 = 4; arvalid_out_m2 = 0; arready_out_s1 = 0;
        rdata_out_s1 = 59; rvalid_out_s1 = 0; rready_out_m2 = 0; rresp_out_s1 = 0;
        #30
        awaddr_out_m1 = 32'h0000_3034; awprot_out_m1 = 5; awvalid_out_m1 = 1; awready_out_s2 = 1;
        wdata_out_m1 = 52; wstrb_out_m1 = 5; wvalid_out_m1 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m1 = 1;
        araddr_out_m1 = 32'h0000_3035; arprot_out_m1 = 7; arvalid_out_m1 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 53; rvalid_out_s2 = 1; rready_out_m1 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m2 = 32'h0000_204c; awprot_out_m2 = 4; awvalid_out_m2 = 1; awready_out_s1 = 1;
        wdata_out_m2 = 60; wstrb_out_m2 = 4; wvalid_out_m2 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m2 = 1;
        araddr_out_m2 = 32'h0000_204d; arprot_out_m2 = 6; arvalid_out_m2 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 61; rvalid_out_s1 = 1; rready_out_m2 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m1 = 32'h0000_a036; awprot_out_m1 = 1; awvalid_out_m1 = 0; awready_out_s2 = 0;
        wdata_out_m1 = 54; wstrb_out_m1 = 7; wvalid_out_m1 = 0; wready_out_s2 = 0;
        bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m1 = 0;
        araddr_out_m1 = 32'h0000_b037; arprot_out_m1 = 7; arvalid_out_m1 = 0; arready_out_s2 = 0;
        rdata_out_s2 = 55; rvalid_out_s2 = 0; rready_out_m1 = 0; rresp_out_s2 = 0;
        #30
        awaddr_out_m2 = 32'h0000_c04e; awprot_out_m2 = 0; awvalid_out_m2 = 0; awready_out_s1 = 0;
        wdata_out_m2 = 62; wstrb_out_m2 = 6; wvalid_out_m2 = 0; wready_out_s1 = 0;
        bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m2 = 0;
        araddr_out_m2 = 32'h0000_d04f; arprot_out_m2 = 6; arvalid_out_m2 = 0; arready_out_s1 = 0;
        rdata_out_s1 = 63; rvalid_out_s1 = 0; rready_out_m2 = 0; rresp_out_s1 = 0;
        // M1 & M2 ---> S1
        #30
        awaddr_out_m1 = 32'h0000_2050; awprot_out_m1 = 0; awvalid_out_m1 = 1; awready_out_s1 = 1;   awaddr_out_m2 = 32'h0000_2058; awprot_out_m2 = 1; awvalid_out_m2 = 1; awready_out_s1 = 1;
        wdata_out_m1 = 64; wstrb_out_m1 = 8; wvalid_out_m1 = 1; wready_out_s1 = 1;                  wdata_out_m2 = 72; wstrb_out_m2 = 12; wvalid_out_m2 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m1 = 1;                                     bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m2 = 1;
        araddr_out_m1 = 32'h0000_2051; arprot_out_m1 = 1; arvalid_out_m1 = 1; arready_out_s1 = 1;   araddr_out_m2 = 32'h0000_2059; arprot_out_m2 = 0; arvalid_out_m2 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 65; rvalid_out_s1 = 1; rready_out_m1 = 1; rresp_out_s1 = 2;                  rdata_out_s1 = 73; rvalid_out_s1 = 1; rready_out_m2 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m1 = 32'h0000_2052; awprot_out_m1 = 2; awvalid_out_m1 = 1; awready_out_s1 = 1;   awaddr_out_m2 = 32'h0000_206a; awprot_out_m2 = 3; awvalid_out_m2 = 1; awready_out_s1 = 1;
        wdata_out_m1 = 66; wstrb_out_m1 = 9; wvalid_out_m1 = 1; wready_out_s1 = 1;                  wdata_out_m2 = 74; wstrb_out_m2 = 13; wvalid_out_m2 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 2; bvalid_out_s1 = 1; bready_out_m1 = 1;                                     bresp_out_s1 = 2; bvalid_out_s1 = 1; bready_out_m2 = 1;
        araddr_out_m1 = 32'h0000_2053; arprot_out_m1 = 3; arvalid_out_m1 = 1; arready_out_s1 = 1;   araddr_out_m2 = 32'h0000_206b; arprot_out_m2 = 2; arvalid_out_m2 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 67; rvalid_out_s1 = 1; rready_out_m1 = 1; rresp_out_s1 = 0;                  rdata_out_s1 = 75; rvalid_out_s1 = 1; rready_out_m2 = 1; rresp_out_s1 = 0;
        #30
        awaddr_out_m1 = 32'h0000_2054; awprot_out_m1 = 4; awvalid_out_m1 = 1; awready_out_s1 = 1;   awaddr_out_m2 = 32'h0000_206c; awprot_out_m2 = 5; awvalid_out_m2 = 1; awready_out_s1 = 1;
        wdata_out_m1 = 68; wstrb_out_m1 = 10; wvalid_out_m1 = 1; wready_out_s1 = 1;                 wdata_out_m2 = 76; wstrb_out_m2 = 14; wvalid_out_m2 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m1 = 1;                                     bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m2 = 1;
        araddr_out_m1 = 32'h0000_2055; arprot_out_m1 = 5; arvalid_out_m1 = 1; arready_out_s1 = 1;   araddr_out_m2 = 32'h0000_206d; arprot_out_m2 = 4; arvalid_out_m2 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 69; rvalid_out_s1 = 1; rready_out_m1 = 1; rresp_out_s1 = 2;                  rdata_out_s1 = 77; rvalid_out_s1 = 1; rready_out_m2 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m1 = 32'h0000_e056; awprot_out_m1 = 0; awvalid_out_m1 = 0; awready_out_s1 = 0;   awaddr_out_m2 = 32'h0001_006e; awprot_out_m2 = 7; awvalid_out_m2 = 0; awready_out_s1 = 0;
        wdata_out_m1 = 70; wstrb_out_m1 = 11; wvalid_out_m1 = 0; wready_out_s1 = 0;                 wdata_out_m2 = 78; wstrb_out_m2 = 15; wvalid_out_m2 = 0; wready_out_s1 = 0;
        bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m1 = 0;                                     bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m2 = 0;
        araddr_out_m1 = 32'h0000_f057; arprot_out_m1 = 7; arvalid_out_m1 = 0; arready_out_s1 = 0;   araddr_out_m2 = 32'h0002_006f; arprot_out_m2 = 6; arvalid_out_m2 = 0; arready_out_s1 = 0;
        rdata_out_s1 = 71; rvalid_out_s1 = 0; rready_out_m1 = 0; rresp_out_s1 = 0;                  rdata_out_s1 = 79; rvalid_out_s1 = 0; rready_out_m2 = 0; rresp_out_s1 = 0;
        // M1 & M2 ---> S2
        #30
        awaddr_out_m1 = 32'h0000_3070; awprot_out_m1 = 1; awvalid_out_m1 = 1; awready_out_s2 = 1;   awaddr_out_m2 = 32'h0000_3078; awprot_out_m2 = 0; awvalid_out_m2 = 1; awready_out_s2 = 1;
        wdata_out_m1 = 80; wstrb_out_m1 = 0; wvalid_out_m1 = 1; wready_out_s2 = 1;                  wdata_out_m2 = 88; wstrb_out_m2 = 4; wvalid_out_m2 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m1 = 1;                                     bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m2 = 1;
        araddr_out_m1 = 32'h0000_3071; arprot_out_m1 = 0; arvalid_out_m1 = 1; arready_out_s2 = 1;   araddr_out_m2 = 32'h0000_3079; arprot_out_m2 = 1; arvalid_out_m2 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 81; rvalid_out_s2 = 1; rready_out_m1 = 1; rresp_out_s2 = 2;                  rdata_out_s2 = 89; rvalid_out_s2 = 1; rready_out_m2 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m1 = 32'h0000_3072; awprot_out_m1 = 3; awvalid_out_m1 = 1; awready_out_s2 = 1;   awaddr_out_m2 = 32'h0000_307a; awprot_out_m2 = 2; awvalid_out_m2 = 1; awready_out_s2 = 1;
        wdata_out_m1 = 82; wstrb_out_m1 = 1; wvalid_out_m1 = 1; wready_out_s2 = 1;                  wdata_out_m2 = 90; wstrb_out_m2 = 5; wvalid_out_m2 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 2; bvalid_out_s2 = 1; bready_out_m1 = 1;                                     bresp_out_s2 = 2; bvalid_out_s2 = 1; bready_out_m2 = 1;
        araddr_out_m1 = 32'h0000_3073; arprot_out_m1 = 2; arvalid_out_m1 = 1; arready_out_s2 = 1;   araddr_out_m2 = 32'h0000_307b; arprot_out_m2 = 3; arvalid_out_m2 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 83; rvalid_out_s2 = 1; rready_out_m1 = 1; rresp_out_s2 = 0;                  rdata_out_s2 = 91; rvalid_out_s2 = 1; rready_out_m2 = 1; rresp_out_s2 = 0;
        #30
        awaddr_out_m1 = 32'h0000_3074; awprot_out_m1 = 5; awvalid_out_m1 = 1; awready_out_s2 = 1;   awaddr_out_m2 = 32'h0000_307c; awprot_out_m2 = 4; awvalid_out_m2 = 1; awready_out_s2 = 1;
        wdata_out_m1 = 84; wstrb_out_m1 = 2; wvalid_out_m1 = 1; wready_out_s2 = 1;                  wdata_out_m2 = 92; wstrb_out_m2 = 6; wvalid_out_m2 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m1 = 1;                                     bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m2 = 1;
        araddr_out_m1 = 32'h0000_3075; arprot_out_m1 = 4; arvalid_out_m1 = 1; arready_out_s2 = 1;   araddr_out_m2 = 32'h0000_307d; arprot_out_m2 = 5; arvalid_out_m2 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 85; rvalid_out_s2 = 1; rready_out_m1 = 1; rresp_out_s2 = 2;                  rdata_out_s2 = 93; rvalid_out_s2 = 1; rready_out_m2 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m1 = 32'h0004_0076; awprot_out_m1 = 1; awvalid_out_m1 = 0; awready_out_s2 = 0;   awaddr_out_m2 = 32'h0006_007e; awprot_out_m2 = 6; awvalid_out_m2 = 0; awready_out_s2 = 0;
        wdata_out_m1 = 86; wstrb_out_m1 = 3; wvalid_out_m1 = 0; wready_out_s2 = 0;                  wdata_out_m2 = 94; wstrb_out_m2 = 7; wvalid_out_m2 = 0; wready_out_s2 = 0;
        bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m1 = 0;                                     bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m2 = 0;
        araddr_out_m1 = 32'h0005_0077; arprot_out_m1 = 6; arvalid_out_m1 = 0; arready_out_s2 = 0;   araddr_out_m2 = 32'h0007_007f; arprot_out_m2 = 7; arvalid_out_m2 = 0; arready_out_s2 = 0;
        rdata_out_s2 = 87; rvalid_out_s2 = 0; rready_out_m1 = 0; rresp_out_s2 = 0;                  rdata_out_s2 = 95; rvalid_out_s2 = 0; rready_out_m2 = 0; rresp_out_s2 = 0;
        // M2 & M1 ---> S1
        #30
        awaddr_out_m2 = 32'h0000_2080; awprot_out_m2 = 0; awvalid_out_m2 = 1; awready_out_s1 = 1;   awaddr_out_m2 = 32'h0000_2088; awprot_out_m2 = 1; awvalid_out_m2 = 1; awready_out_s1 = 1;
        wdata_out_m2 = 96; wstrb_out_m2 = 0; wvalid_out_m2 = 1; wready_out_s1 = 1;                  wdata_out_m2 = 104; wstrb_out_m2 = 4; wvalid_out_m2 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m2 = 1;                                     bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m2 = 1;
        araddr_out_m2 = 32'h0000_2081; arprot_out_m2 = 7; arvalid_out_m2 = 1; arready_out_s1 = 1;   araddr_out_m2 = 32'h0000_2089; arprot_out_m2 = 6; arvalid_out_m2 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 97; rvalid_out_s1 = 1; rready_out_m2 = 1; rresp_out_s1 = 2;                  rdata_out_s1 = 105; rvalid_out_s1 = 1; rready_out_m2 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m2 = 32'h0000_2082; awprot_out_m2 = 2; awvalid_out_m2 = 0; awready_out_s1 = 0;   awaddr_out_m2 = 32'h0000_208a; awprot_out_m2 = 3; awvalid_out_m2 = 0; awready_out_s1 = 0;
        wdata_out_m2 = 98; wstrb_out_m2 = 1; wvalid_out_m2 = 0; wready_out_s1 = 0;                  wdata_out_m2 = 106; wstrb_out_m2 = 5; wvalid_out_m2 = 0; wready_out_s1 = 0;
        bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m2 = 0;                                     bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m2 = 0;
        araddr_out_m2 = 32'h0000_2083; arprot_out_m2 = 5; arvalid_out_m2 = 0; arready_out_s1 = 0;   araddr_out_m2 = 32'h0000_208b; arprot_out_m2 = 4; arvalid_out_m2 = 0; arready_out_s1 = 0;
        rdata_out_s1 = 99; rvalid_out_s1 = 0; rready_out_m2 = 0; rresp_out_s1 = 0;                  rdata_out_s1 = 107; rvalid_out_s1 = 0; rready_out_m2 = 0; rresp_out_s1 = 0;
        #30
        awaddr_out_m2 = 32'h0000_2084; awprot_out_m2 = 4; awvalid_out_m2 = 1; awready_out_s1 = 1;   awaddr_out_m2 = 32'h0000_208c; awprot_out_m2 = 5; awvalid_out_m2 = 1; awready_out_s1 = 1;
        wdata_out_m2 = 100; wstrb_out_m2 = 2; wvalid_out_m2 = 1; wready_out_s1 = 1;                 wdata_out_m2 = 108; wstrb_out_m2 = 6; wvalid_out_m2 = 1; wready_out_s1 = 1;
        bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m2 = 1;                                     bresp_out_s1 = 0; bvalid_out_s1 = 1; bready_out_m2 = 1;
        araddr_out_m2 = 32'h0000_2085; arprot_out_m2 = 3; arvalid_out_m2 = 1; arready_out_s1 = 1;   araddr_out_m2 = 32'h0000_208d; arprot_out_m2 = 2; arvalid_out_m2 = 1; arready_out_s1 = 1;
        rdata_out_s1 = 101; rvalid_out_s1 = 1; rready_out_m2 = 1; rresp_out_s1 = 2;                 rdata_out_s1 = 109; rvalid_out_s1 = 1; rready_out_m2 = 1; rresp_out_s1 = 2;
        #30
        awaddr_out_m2 = 32'h0008_0086; awprot_out_m2 = 6; awvalid_out_m2 = 0; awready_out_s1 = 0;   awaddr_out_m2 = 32'h000a_008e; awprot_out_m2 = 7; awvalid_out_m2 = 0; awready_out_s1 = 0;
        wdata_out_m2 = 102; wstrb_out_m2 = 3; wvalid_out_m2 = 0; wready_out_s1 = 0;                 wdata_out_m2 = 110; wstrb_out_m2 = 7; wvalid_out_m2 = 0; wready_out_s1 = 0;
        bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m2 = 0;                                     bresp_out_s1 = 2; bvalid_out_s1 = 0; bready_out_m2 = 0;
        araddr_out_m2 = 32'h0009_0087; arprot_out_m2 = 1; arvalid_out_m2 = 0; arready_out_s1 = 0;   araddr_out_m2 = 32'h000f_008f; arprot_out_m2 = 0; arvalid_out_m2 = 0; arready_out_s1 = 0;
        rdata_out_s1 = 103; rvalid_out_s1 = 0; rready_out_m2 = 0; rresp_out_s1 = 0;                 rdata_out_s1 = 111; rvalid_out_s1 = 0; rready_out_m2 = 0; rresp_out_s1 = 0;
        // M2 & M1 ---> S2
        #30
        awaddr_out_m2 = 32'h0000_3090; awprot_out_m2 = 0; awvalid_out_m2 = 1; awready_out_s2 = 1;   awaddr_out_m1 = 32'h0000_3098; awprot_out_m1 = 7; awvalid_out_m1 = 1; awready_out_s2 = 1;
        wdata_out_m2 = 112; wstrb_out_m2 = 8; wvalid_out_m2 = 1; wready_out_s2 = 1;                 wdata_out_m1 = 120; wstrb_out_m1 = 12; wvalid_out_m1 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m2 = 1;                                     bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m1 = 1;
        araddr_out_m2 = 32'h0000_3091; arprot_out_m2 = 1; arvalid_out_m2 = 1; arready_out_s2 = 1;   araddr_out_m1 = 32'h0000_3099; arprot_out_m1 = 6; arvalid_out_m1 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 113; rvalid_out_s2 = 1; rready_out_m2 = 1; rresp_out_s2 = 2;                 rdata_out_s2 = 121; rvalid_out_s2 = 1; rready_out_m1 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m2 = 32'h0000_3092; awprot_out_m2 = 2; awvalid_out_m2 = 0; awready_out_s2 = 0;   awaddr_out_m1 = 32'h0000_309a; awprot_out_m1 = 5; awvalid_out_m1 = 0; awready_out_s2 = 0;
        wdata_out_m2 = 114; wstrb_out_m2 = 9; wvalid_out_m2 = 0; wready_out_s2 = 0;                 wdata_out_m1 = 122; wstrb_out_m1 = 13; wvalid_out_m1 = 0; wready_out_s2 = 0;
        bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m2 = 0;                                     bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m1 = 0;
        araddr_out_m2 = 32'h0000_3093; arprot_out_m2 = 3; arvalid_out_m2 = 0; arready_out_s2 = 0;   araddr_out_m1 = 32'h0000_309b; arprot_out_m1 = 4; arvalid_out_m1 = 0; arready_out_s2 = 0;
        rdata_out_s2 = 115; rvalid_out_s2 = 0; rready_out_m2 = 0; rresp_out_s2 = 0;                 rdata_out_s2 = 123; rvalid_out_s2 = 0; rready_out_m1 = 0; rresp_out_s2 = 0;
        #30
        awaddr_out_m2 = 32'h0000_3094; awprot_out_m2 = 4; awvalid_out_m2 = 1; awready_out_s2 = 1;   awaddr_out_m1 = 32'h0000_309c; awprot_out_m1 = 3; awvalid_out_m1 = 1; awready_out_s2 = 1;
        wdata_out_m2 = 116; wstrb_out_m2 = 10; wvalid_out_m2 = 1; wready_out_s2 = 1;                 wdata_out_m1 = 124; wstrb_out_m1 = 14; wvalid_out_m1 = 1; wready_out_s2 = 1;
        bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m2 = 1;                                     bresp_out_s2 = 0; bvalid_out_s2 = 1; bready_out_m1 = 1;
        araddr_out_m2 = 32'h0000_3095; arprot_out_m2 = 5; arvalid_out_m2 = 1; arready_out_s2 = 1;   araddr_out_m1 = 32'h0000_309d; arprot_out_m1 = 2; arvalid_out_m1 = 1; arready_out_s2 = 1;
        rdata_out_s2 = 117; rvalid_out_s2 = 1; rready_out_m2 = 1; rresp_out_s2 = 2;                 rdata_out_s2 = 125; rvalid_out_s2 = 1; rready_out_m1 = 1; rresp_out_s2 = 2;
        #30
        awaddr_out_m2 = 32'h0000_8096; awprot_out_m2 = 6; awvalid_out_m2 = 0; awready_out_s2 = 0;   awaddr_out_m1 = 32'h0000_409e; awprot_out_m1 = 1; awvalid_out_m1 = 0; awready_out_s2 = 0;
        wdata_out_m2 = 118; wstrb_out_m2 = 11; wvalid_out_m2 = 0; wready_out_s2 = 0;                 wdata_out_m1 = 126; wstrb_out_m1 = 15; wvalid_out_m1 = 0; wready_out_s2 = 0;
        bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m2 = 0;                                     bresp_out_s2 = 2; bvalid_out_s2 = 0; bready_out_m1 = 0;
        araddr_out_m2 = 32'h0000_9097; arprot_out_m2 = 7; arvalid_out_m2 = 0; arready_out_s2 = 0;   araddr_out_m1 = 32'h0000_509f; arprot_out_m1 = 0; arvalid_out_m1 = 0; arready_out_s2 = 0;
        rdata_out_s2 = 119; rvalid_out_s2 = 0; rready_out_m2 = 0; rresp_out_s2 = 0;                 rdata_out_s2 = 127; rvalid_out_s2 = 0; rready_out_m1 = 0; rresp_out_s2 = 0;
        #500 $finish;
    end

endmodule