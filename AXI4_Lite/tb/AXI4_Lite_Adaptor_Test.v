`timescale 1ns/1ns

module axi4_lite_adaptor_tb;
    
    reg aclk;
    reg aresetn;
    // Write Address Channel
    reg [31:0] awaddr_in;
    wire [31:0] awaddr_out;
    reg [2:0] awprot_in;
    wire [2:0] awprot_out;
    wire awvalid;
    reg awready;
    // Write Data Channel
    reg [31:0] wdata_in;
    wire [31:0] wdata_out;
    reg [3:0] wstrb_in;
    wire [3:0] wstrb_out;
    wire wvalid;
    reg wready;
    // Write Response Channel
    wire [1:0] bresp;
    wire bvalid;
    wire bready;
    // Read Address Channel
    reg [31:0] araddr_in;
    wire [31:0] araddr_out;
    reg [2:0] arprot_in;
    wire [2:0] arprot_out;
    wire arvalid;
    reg arready;
    // Read Data Channel
    reg [31:0] rdata_in;
    wire [31:0] rdata_out;
    wire [1:0] rresp;
    wire rvalid;
    wire rready;

    axi4_lite_adaptor_top_design uut(
        aclk,aresetn,
        // Write Address Channel
        awaddr_in,awaddr_out,awprot_in,awprot_out,awvalid,awready,
        // Write Data Channel
        wdata_in,wdata_out,wstrb_in,wstrb_out,wvalid,wready,
        // Write Response Channel
        bresp,bvalid,bready,
        // Read Address Channel
        araddr_in,araddr_out,arprot_in,arprot_out,arvalid,arready,
        // Read Data Channel
        rdata_in,rdata_out,rresp,rvalid,rready
    );

    initial begin
        $dumpfile("./temp/AXI4_Lite_Adaptor_Test.vcd");
        $dumpvars(0,axi4_lite_adaptor_tb);
    end

    initial aclk = 0;
    always #5 aclk = ~aclk;

    initial begin
        awaddr_in = 16;
        awprot_in = 3;
        wdata_in = 32'b1111_0000_1011_0100_1010_0101_1001_0110;
        wstrb_in = 4'b1011;
        araddr_in = 32;
        arprot_in = 5;
        rdata_in = 32'b1111_0000_1011_0100_1010_0101_1001_0110;
        aresetn = 1;
        #22 aresetn = 0;
        #48 aresetn = 1;
        #1000 $finish;
    end

endmodule