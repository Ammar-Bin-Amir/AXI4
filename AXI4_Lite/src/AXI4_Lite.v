module axi4_lite (
    input aclk,
    input aresetn,
    // External Input(s) for Driving Output(s) of Master 1
    input [31:0] ext_awaddr_in_m1,
    input [2:0] ext_awprot_in_m1,
    input [31:0] ext_wdata_in_m1,
    input [3:0] ext_wstrb_in_m1,
    input [31:0] ext_araddr_in_m1,
    input [2:0] ext_arprot_in_m1,
    // External Input(s) for Driving Output(s) of Master 2
    input [31:0] ext_awaddr_in_m2,
    input [2:0] ext_awprot_in_m2,
    input [31:0] ext_wdata_in_m2,
    input [3:0] ext_wstrb_in_m2,
    input [31:0] ext_araddr_in_m2,
    input [2:0] ext_arprot_in_m2,
    // External Input(s) for Driving Output(s) of Slave 1
    input [31:0] ext_rdata_in_s1,
    // External Input(s) for Driving Output(s) of Slave 2
    input [31:0] ext_rdata_in_s2
);

    // Write Address Channel
    // Master 1
    wire [31:0] awaddr_out_m1;
    wire [2:0] awprot_out_m1;
    wire awvalid_out_m1;
    wire awready_in_m1;
    // Master 2
    wire [31:0] awaddr_out_m2;
    wire [2:0] awprot_out_m2;
    wire awvalid_out_m2;
    wire awready_in_m2;
    // Slave 1
    wire [31:0] awaddr_in_s1;
    wire [2:0] awprot_in_s1;
    wire awvalid_in_s1;
    wire awready_out_s1;
    // Slave 2
    wire [31:0] awaddr_in_s2;
    wire [2:0] awprot_in_s2;
    wire awvalid_in_s2;
    wire awready_out_s2;
    // Write Data Channel
    // Master 1
    wire [31:0] wdata_out_m1;
    wire [3:0] wstrb_out_m1;
    wire wvalid_out_m1;
    wire wready_in_m1;
    // Master 2
    wire [31:0] wdata_out_m2;
    wire [3:0] wstrb_out_m2;
    wire wvalid_out_m2;
    wire wready_in_m2;
    // Slave 1
    wire [31:0] wdata_in_s1;
    wire [3:0] wstrb_in_s1;
    wire wvalid_in_s1;
    wire wready_out_s1;
    // Slave 2
    wire [31:0] wdata_in_s2;
    wire [3:0] wstrb_in_s2;
    wire wvalid_in_s2;
    wire wready_out_s2;
    // Write Response Channel
    // Master 1
    wire [1:0] bresp_in_m1;
    wire bvalid_in_m1;
    wire bready_out_m1;
    // Master 2
    wire [1:0] bresp_in_m2;
    wire bvalid_in_m2;
    wire bready_out_m2;
    // Slave 1
    wire [1:0] bresp_out_s1;
    wire bvalid_out_s1;
    wire bready_in_s1;
    // Slave 2
    wire [1:0] bresp_out_s2;
    wire bvalid_out_s2;
    wire bready_in_s2;
    // Read Address Channel
    // Master 1
    wire [31:0] araddr_out_m1;
    wire [2:0] arprot_out_m1;
    wire arvalid_out_m1;
    wire arready_in_m1;
    // Master 2
    wire [31:0] araddr_out_m2;
    wire [2:0] arprot_out_m2;
    wire arvalid_out_m2;
    wire arready_in_m2;
    // Slave 1
    wire [31:0] araddr_in_s1;
    wire [2:0] arprot_in_s1;
    wire arvalid_in_s1;
    wire arready_out_s1;
    // Slave 2
    wire [31:0] araddr_in_s2;
    wire [2:0] arprot_in_s2;
    wire arvalid_in_s2;
    wire arready_out_s2;
    // Read Data Channel
    // Master 1
    wire [31:0] rdata_in_m1;
    wire rvalid_in_m1;
    wire rready_out_m1;
    wire [1:0] rresp_in_m1;
    // Master 2
    wire [31:0] rdata_in_m2;
    wire rvalid_in_m2;
    wire rready_out_m2;
    wire [1:0] rresp_in_m2;
    // Slave 1
    wire [31:0] rdata_out_s1;
    wire rvalid_out_s1;
    wire rready_in_s1;
    wire [1:0] rresp_out_s1;
    // Slave 2
    wire [31:0] rdata_out_s2;
    wire rvalid_out_s2;
    wire rready_in_s2;
    wire [1:0] rresp_out_s2;

    axi4_lite_master_adaptor uut_m1(
        .aclk (aclk),
        .aresetn (aresetn),
        // Write Address Channel
        .awaddr_out (awaddr_out_m1),
        .awprot_out (awprot_out_m1),
        .awvalid_out (awvalid_out_m1),
        .awready_in (awready_in_m1),
        .awaddr_in (ext_awaddr_in_m1),
        .awprot_in (ext_awprot_in_m1),
        // Write Data Channel
        .wdata_out (wdata_out_m1),
        .wstrb_out (wstrb_out_m1),
        .wvalid_out (wvalid_out_m1),
        .wready_in (wready_in_m1),
        .wdata_in (ext_wdata_in_m1),
        .wstrb_in (ext_wstrb_in_m1),
        // Write Response Channel
        .bresp_in (bresp_in_m1),
        .bvalid_in (bvalid_in_m1),
        .bready_out (bready_out_m1),
        // Read Address Channel
        .araddr_out (araddr_out_m1),
        .arprot_out (arprot_out_m1),
        .arvalid_out (arvalid_out_m1),
        .arready_in (arready_in_m1),
        .araddr_in (ext_araddr_in_m1),
        .arprot_in (ext_arprot_in_m1),
        // Read Data Channel
        .rdata_in (rdata_in_m1),
        .rresp_in (rresp_in_m1),
        .rvalid_in (rvalid_in_m1),
        .rready_out (rready_out_m1)
    );

    axi4_lite_master_adaptor uut_m2(
        .aclk (aclk),
        .aresetn (aresetn),
        // Write Address Channel
        .awaddr_out (awaddr_out_m2),
        .awprot_out (awprot_out_m2),
        .awvalid_out (awvalid_out_m2),
        .awready_in (awready_in_m2),
        .awaddr_in (ext_awaddr_in_m2),
        .awprot_in (ext_awprot_in_m2),
        // Write Data Channel
        .wdata_out (wdata_out_m2),
        .wstrb_out (wstrb_out_m2),
        .wvalid_out (wvalid_out_m2),
        .wready_in (wready_in_m2),
        .wdata_in (ext_wdata_in_m2),
        .wstrb_in (ext_wstrb_in_m2),
        // Write Response Channel
        .bresp_in (bresp_in_m2),
        .bvalid_in (bvalid_in_m2),
        .bready_out (bready_out_m2),
        // Read Address Channel
        .araddr_out (araddr_out_m2),
        .arprot_out (arprot_out_m2),
        .arvalid_out (arvalid_out_m2),
        .arready_in (arready_in_m2),
        .araddr_in (ext_araddr_in_m2),
        .arprot_in (ext_arprot_in_m2),
        // Read Data Channel
        .rdata_in (rdata_in_m2),
        .rresp_in (rresp_in_m2),
        .rvalid_in (rvalid_in_m2),
        .rready_out (rready_out_m2)
    );

    axi4_lite_crossbar_2x2 uut_xbar_2x2(
        .aclk (),
        .aresetn (),
        // WRITE ADDRESS CHANNEL
        // Master 1
        .awaddr_out_m1 (awaddr_out_m1),
        .awprot_out_m1 (awprot_out_m1),
        .awvalid_out_m1 (awvalid_out_m1),
        .awready_in_m1 (awready_in_m1),
        // Master 2
        .awaddr_out_m2 (awaddr_out_m2),
        .awprot_out_m2 (awprot_out_m2),
        .awvalid_out_m2 (awvalid_out_m2),
        .awready_in_m2 (awready_in_m2),
        // Slave 1
        .awaddr_in_s1 (awaddr_in_s1),
        .awprot_in_s1 (awprot_in_s1),
        .awvalid_in_s1 (awvalid_in_s1),
        .awready_out_s1 (awready_out_s1),
        // Slave 2
        .awaddr_in_s2 (awaddr_in_s2),
        .awprot_in_s2 (awprot_in_s2),
        .awvalid_in_s2 (awvalid_in_s2),
        .awready_out_s2 (awready_out_s2),
        // WRITE DATA CHANNEL
        // Master 1
        .wdata_out_m1 (wdata_out_m1),
        .wstrb_out_m1 (wstrb_out_m1),
        .wvalid_out_m1 (wvalid_out_m1),
        .wready_in_m1 (wready_in_m1),
        // Master 2
        .wdata_out_m2 (wdata_out_m2),
        .wstrb_out_m2 (wstrb_out_m2),
        .wvalid_out_m2 (wvalid_out_m2),
        .wready_in_m2 (wready_in_m2),
        // Slave 1
        .wdata_in_s1 (wdata_in_s1),
        .wstrb_in_s1 (wstrb_in_s1),
        .wvalid_in_s1 (wvalid_in_s1),
        .wready_out_s1 (wready_out_s1),
        // Slave 2
        .wdata_in_s2 (wdata_in_s2),
        .wstrb_in_s2 (wstrb_in_s2),
        .wvalid_in_s2 (wvalid_in_s2),
        .wready_out_s2 (wready_out_s2),
        // WRITE RESPONSE CHANNEL
        // Master 1
        .bresp_in_m1 (bresp_in_m1),
        .bvalid_in_m1 (bvalid_in_m1),
        .bready_out_m1 (bready_out_m1),
        // Master 2
        .bresp_in_m2 (bresp_in_m2),
        .bvalid_in_m2 (bvalid_in_m2),
        .bready_out_m2 (bready_out_m2),
        // Slave 1
        .bresp_out_s1 (bresp_out_s1),
        .bvalid_out_s1 (bvalid_out_s1),
        .bready_in_s1 (bready_in_s1),
        // Slave 2
        .bresp_out_s2 (bresp_out_s2),
        .bvalid_out_s2 (bvalid_out_s2),
        .bready_in_s2 (bready_in_s2),
        // READ RESPONSE CHANNEL
        // Master 1
        .araddr_out_m1 (araddr_out_m1),
        .arprot_out_m1 (arprot_out_m1),
        .arvalid_out_m1 (arvalid_out_m1),
        .arready_in_m1 (arready_in_m1),
        // Master 2
        .araddr_out_m2 (araddr_out_m2),
        .arprot_out_m2 (arprot_out_m2),
        .arvalid_out_m2 (arvalid_out_m2),
        .arready_in_m2 (arready_in_m2),
        // Slave 1
        .araddr_in_s1 (araddr_in_s1),
        .arprot_in_s1 (arprot_in_s1),
        .arvalid_in_s1 (arvalid_in_s1),
        .arready_out_s1 (arready_out_s1),
        // Slave 2
        .araddr_in_s2 (araddr_in_s2),
        .arprot_in_s2 (arprot_in_s2),
        .arvalid_in_s2 (arvalid_in_s2),
        .arready_out_s2 (arready_out_s2),
        // READ DATA CHANNEL
        // Master 1
        .rdata_in_m1 (rdata_in_m1),
        .rvalid_in_m1 (rvalid_in_m1),
        .rready_out_m1 (rready_out_m1),
        .rresp_in_m1 (rresp_in_m1),
        // Master 2
        .rdata_in_m2 (rdata_in_m2),
        .rvalid_in_m2 (rvalid_in_m2),
        .rready_out_m2 (rready_out_m2),
        .rresp_in_m2 (rresp_in_m2),
        // Slave 1
        .rdata_out_s1 (rdata_out_s1),
        .rvalid_out_s1 (rvalid_out_s1),
        .rready_in_s1 (rready_in_s1),
        .rresp_out_s1 (rresp_out_s1),
        // Slave 2
        .rdata_out_s2 (rdata_out_s2),
        .rvalid_out_s2 (rvalid_out_s2),
        .rready_in_s2 (rready_in_s2),
        .rresp_out_s2 (rresp_out_s2)
    );

    axi4_lite_slave_adaptor uut_s1(
        .aclk (aclk),
        .aresetn (aresetn),
        // Write Address Channel
        .awaddr_in (awaddr_in_s1),
        .awprot_in (awprot_in_s1),
        .awvalid_in (awvalid_in_s1),
        .awready_out (awready_out_s1),
        // Write Data Channel
        .wdata_in (wdata_in_s1),
        .wstrb_in (wstrb_in_s1),
        .wvalid_in (wvalid_in_s1),
        .wready_out (wready_out_s1),
        // Write Response Channel
        .bresp_out (bresp_out_s1),
        .bvalid_out (bvalid_out_s1),
        .bready_in (bready_in_s1),
        // Read Address Channel
        .araddr_in (araddr_in_s1),
        .arprot_in (arprot_in_s1),
        .arvalid_in (arvalid_in_s1),
        .arready_out (arready_out_s1),
        // Read Data Channel
        .rdata_out (rdata_out_s1),
        .rresp_out (rresp_out_s1),
        .rvalid_out (rvalid_out_s1),
        .rready_in (rready_in_s1),
        .rdata_in (ext_rdata_in_s1)
    );

    axi4_lite_slave_adaptor uut_s2(
        .aclk (aclk),
        .aresetn (aresetn),
        // Write Address Channel
        .awaddr_in (awaddr_in_s2),
        .awprot_in (awprot_in_s2),
        .awvalid_in (awvalid_in_s2),
        .awready_out (awready_out_s2),
        // Write Data Channel
        .wdata_in (wdata_in_s2),
        .wstrb_in (wstrb_in_s2),
        .wvalid_in (wvalid_in_s2),
        .wready_out (wready_out_s2),
        // Write Response Channel
        .bresp_out (bresp_out_s2),
        .bvalid_out (bvalid_out_s2),
        .bready_in (bready_in_s2),
        // Read Address Channel
        .araddr_in (araddr_in_s2),
        .arprot_in (arprot_in_s2),
        .arvalid_in (arvalid_in_s2),
        .arready_out (arready_out_s2),
        // Read Data Channel
        .rdata_out (rdata_out_s2),
        .rresp_out (rresp_out_s2),
        .rvalid_out (rvalid_out_s2),
        .rready_in (rready_in_s2),
        .rdata_in (ext_rdata_in_s2)
    );
    
endmodule
