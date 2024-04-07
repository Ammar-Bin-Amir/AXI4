`timescale 1ns/1ns

module axi4_lite_master_adaptor_tb;
    
    reg aclk;
    reg aresetn;
    // Write Address Channel
    wire [31:0] awaddr_out;
    wire [2:0] awprot_out;
    wire awvalid_out;
    reg awready_in;
    //// Input(s) for Driving Output(s) of Write Address Channel
    reg [31:0] awaddr_in;
    reg [2:0] awprot_in;
    // Write Data Channel
    wire [31:0] wdata_out;
    wire [3:0] wstrb_out;
    wire wvalid_out;
    reg wready_in;
    //// Input(s) for Driving Output(s) of Write Data Channel
    reg [31:0] wdata_in;
    reg [3:0] wstrb_in;
    // Write Response Channel
    reg [1:0] bresp_in;
    reg bvalid_in;
    wire bready_out;
    // Read Address Channel
    wire [31:0] araddr_out;
    wire [2:0] arprot_out;
    wire arvalid_out;
    reg arready_in;
    //// Input(s) for Driving Output(s) of Read Address Channel
    reg [31:0] araddr_in;
    reg [2:0] arprot_in;
    // Read Data Channel
    reg [31:0] rdata_in;
    reg [1:0] rresp_in;
    reg rvalid_in;
    wire rready_out;

    axi4_lite_master_adaptor uut(
        aclk,aresetn,
        // Write Address Channel
        awaddr_out,awprot_out,awvalid_out,awready_in,awaddr_in,awprot_in,
        // Write Data Channel
        wdata_out,wstrb_out,wvalid_out,wready_in,wdata_in,wstrb_in,
        // Write Response Channel
        bresp_in,bvalid_in,bready_out,
        // Read Address Channel
        araddr_out,arprot_out,arvalid_out,arready_in,araddr_in,arprot_in,
        // Read Data Channel
        rdata_in,rresp_in,rvalid_in,rready_out
    );

    initial begin
        $dumpfile("./temp/AXI4_Lite_Master_Adaptor_tb.vcd");
        $dumpvars(0,axi4_lite_master_adaptor_tb);
    end

    initial aclk = 0;
    always #5 aclk = ~aclk;

    initial begin
        awaddr_in = 16;
        awprot_in = 4;
        wdata_in = 32'b1111_0000_1011_0100_1010_0101_1001_0110;
        wstrb_in = 4'b1011;
        araddr_in = 16;
        arprot_in = 4;
        rdata_in = 32'b1111_0000_1011_0100_1010_0101_1001_0110;
        #7 aresetn = 0;
        #8 aresetn = 1;
        #100 awready_in = 1; wready_in = 1; bresp_in = 0; bvalid_in = 1;
        #100 arready_in = 1; rresp_in = 0; rvalid_in = 1;
        #1000 $finish;
    end

endmodule