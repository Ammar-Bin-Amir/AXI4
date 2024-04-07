`timescale 1ns/1ns

module axi4_lite_tb;
    
    reg aclk;
    reg aresetn;
    // External reg(s) for Driving Output(s) of Master 1
    reg [31:0] ext_awaddr_in_m1;
    reg [2:0] ext_awprot_in_m1;
    reg [31:0] ext_wdata_in_m1;
    reg [3:0] ext_wstrb_in_m1;
    reg [31:0] ext_araddr_in_m1;
    reg [2:0] ext_arprot_in_m1;
    // External reg(s) for Driving Output(s) of Master 2
    reg [31:0] ext_awaddr_in_m2;
    reg [2:0] ext_awprot_in_m2;
    reg [31:0] ext_wdata_in_m2;
    reg [3:0] ext_wstrb_in_m2;
    reg [31:0] ext_araddr_in_m2;
    reg [2:0] ext_arprot_in_m2;
    // External reg(s) for Driving Output(s) of Slave 1
    reg [31:0] ext_rdata_in_s1;
    // External reg(s) for Driving Output(s) of Slave 2
    reg [31:0] ext_rdata_in_s2;

    axi4_lite uut(
        aclk, aresetn,
        ext_awaddr_in_m1, ext_awprot_in_m1, ext_wdata_in_m1, ext_wstrb_in_m1, ext_araddr_in_m1, ext_arprot_in_m1,
        ext_awaddr_in_m2, ext_awprot_in_m2, ext_wdata_in_m2, ext_wstrb_in_m2, ext_araddr_in_m2, ext_arprot_in_m2,
        ext_rdata_in_s1,
        ext_rdata_in_s2
    );
    
    initial begin
        $dumpfile("./temp/AXI4_Lite_Test.vcd");
        $dumpvars(0,axi4_lite_tb);
    end

    initial aclk = 0;
    always #10 aclk = ~aclk;

    initial begin
        #10 aresetn = 0;
        #10 aresetn = 1;
        // M1 ---> S1
        #50
        ext_awaddr_in_m1 = 32'h0000_2000;
        ext_awprot_in_m1 = 0;
        ext_wdata_in_m1 = 128;
        ext_wstrb_in_m1 = 15;
        ext_araddr_in_m1 = 32'h0000_2111;
        ext_arprot_in_m1 = 7;
        ext_rdata_in_s1 = 130;
        #50
        ext_awaddr_in_m1 = 32'h0000_0000;
        ext_awprot_in_m1 = 0;
        ext_wdata_in_m1 = 255;
        ext_wstrb_in_m1 = 15;
        ext_araddr_in_m1 = 32'h0000_1111;
        ext_arprot_in_m1 = 0;
        ext_rdata_in_s1 = 254;
        // M1 ---> S2
        #50
        ext_awaddr_in_m1 = 32'h0000_2222;
        ext_awprot_in_m1 = 1;
        ext_wdata_in_m1 = 132;
        ext_wstrb_in_m1 = 14;
        ext_araddr_in_m1 = 32'h0000_2333;
        ext_arprot_in_m1 = 6;
        ext_rdata_in_s2 = 134;
        #50
        ext_awaddr_in_m1 = 32'h0000_4444;
        ext_awprot_in_m1 = 0;
        ext_wdata_in_m1 = 254;
        ext_wstrb_in_m1 = 15;
        ext_araddr_in_m1 = 32'h0000_5555;
        ext_arprot_in_m1 = 0;
        ext_rdata_in_s2 = 253;
        // M2 ---> S1
        #50
        ext_awaddr_in_m2 = 32'h0000_3000;
        ext_awprot_in_m2 = 2;
        ext_wdata_in_m2 = 136;
        ext_wstrb_in_m2 = 13;
        ext_araddr_in_m2 = 32'h0000_3111;
        ext_arprot_in_m2 = 5;
        ext_rdata_in_s1 = 138;
        #50
        ext_awaddr_in_m2 = 32'h0000_6666;
        ext_awprot_in_m2 = 0;
        ext_wdata_in_m2 = 252;
        ext_wstrb_in_m2 = 15;
        ext_araddr_in_m2 = 32'h0000_7777;
        ext_arprot_in_m2 = 0;
        ext_rdata_in_s1 = 251;
        // M2 ---> S2
        #50
        ext_awaddr_in_m2 = 32'h0000_3222;
        ext_awprot_in_m2 = 3;
        ext_wdata_in_m2 = 140;
        ext_wstrb_in_m2 = 12;
        ext_araddr_in_m2 = 32'h0000_3333;
        ext_arprot_in_m2 = 4;
        ext_rdata_in_s2 = 142;
        #50
        ext_awaddr_in_m2 = 32'h0000_8888;
        ext_awprot_in_m2 = 0;
        ext_wdata_in_m2 = 250;
        ext_wstrb_in_m2 = 15;
        ext_araddr_in_m2 = 32'h0000_9999;
        ext_arprot_in_m2 = 0;
        ext_rdata_in_s2 = 249;
        // M1 ---> S1 & M2 ---> S2
        #50
        ext_awaddr_in_m1 = 32'h0000_2444;   ext_awaddr_in_m2 = 32'h0000_3444;
        ext_awprot_in_m1 = 4;               ext_awprot_in_m2 = 5;
        ext_wdata_in_m1 = 144;              ext_wdata_in_m2 = 146;
        ext_wstrb_in_m1 = 11;               ext_wstrb_in_m2 = 10;
        ext_araddr_in_m1 = 32'h0000_2555;   ext_araddr_in_m2 = 32'h0000_3555;
        ext_arprot_in_m1 = 3;               ext_arprot_in_m2 = 2;
        ext_rdata_in_s1 = 148;              ext_rdata_in_s2 = 150;
        #50
        ext_awaddr_in_m1 = 32'h0000_aaaa;   ext_awaddr_in_m2 = 32'h0000_cccc;
        ext_awprot_in_m1 = 0;               ext_awprot_in_m2 = 0;
        ext_wdata_in_m1 = 248;              ext_wdata_in_m2 = 246;
        ext_wstrb_in_m1 = 15;               ext_wstrb_in_m2 = 15;
        ext_araddr_in_m1 = 32'h0000_bbbb;   ext_araddr_in_m2 = 32'h0000_dddd;
        ext_arprot_in_m1 = 0;               ext_arprot_in_m2 = 0;
        ext_rdata_in_s1 = 247;              ext_rdata_in_s2 = 245;
        // M1 ---> S2 & M2 ---> S1
        #50
        ext_awaddr_in_m1 = 32'h0000_3666;   ext_awaddr_in_m2 = 32'h0000_2666;
        ext_awprot_in_m1 = 6;               ext_awprot_in_m2 = 7;
        ext_wdata_in_m1 = 152;              ext_wdata_in_m2 = 154;
        ext_wstrb_in_m1 = 9;                ext_wstrb_in_m2 = 8;
        ext_araddr_in_m1 = 32'h0000_3777;   ext_araddr_in_m2 = 32'h0000_2777;
        ext_arprot_in_m1 = 1;               ext_arprot_in_m2 = 0;
        ext_rdata_in_s2 = 156;              ext_rdata_in_s1 = 158;
        #50
        ext_awaddr_in_m1 = 32'h0000_eeee;   ext_awaddr_in_m2 = 32'h0000_0000;
        ext_awprot_in_m1 = 0;               ext_awprot_in_m2 = 0;
        ext_wdata_in_m1 = 244;              ext_wdata_in_m2 = 242;
        ext_wstrb_in_m1 = 15;               ext_wstrb_in_m2 = 15;
        ext_araddr_in_m1 = 32'h0000_ffff;   ext_araddr_in_m2 = 32'h1111_1111;
        ext_arprot_in_m1 = 0;               ext_arprot_in_m2 = 0;
        ext_rdata_in_s2 = 243;              ext_rdata_in_s1 = 241;
        // M1 & M2 ---> S1
        #50
        ext_awaddr_in_m1 = 32'h0000_2888;   ext_awaddr_in_m2 = 32'h0000_2999;
        ext_awprot_in_m1 = 2;               ext_awprot_in_m2 = 6;
        ext_wdata_in_m1 = 160;              ext_wdata_in_m2 = 162;
        ext_wstrb_in_m1 = 9;                ext_wstrb_in_m2 = 8;
        ext_araddr_in_m1 = 32'h0000_2aaa;   ext_araddr_in_m2 = 32'h0000_2bbb;
        ext_arprot_in_m1 = 4;               ext_arprot_in_m2 = 8;
        ext_rdata_in_s1 = 164;              ext_rdata_in_s1 = 166;
        #50
        ext_awaddr_in_m1 = 32'h2222_2222;   ext_awaddr_in_m2 = 32'h3333_3333;
        ext_awprot_in_m1 = 0;               ext_awprot_in_m2 = 0;
        ext_wdata_in_m1 = 240;              ext_wdata_in_m2 = 238;
        ext_wstrb_in_m1 = 15;               ext_wstrb_in_m2 = 15;
        ext_araddr_in_m1 = 32'h4444_4444;   ext_araddr_in_m2 = 32'h5555_6666;
        ext_arprot_in_m1 = 0;               ext_arprot_in_m2 = 0;
        ext_rdata_in_s1 = 239;              ext_rdata_in_s1 = 237;
        // M1 & M2 ---> S2
        #50
        ext_awaddr_in_m1 = 32'h0000_3ccc;   ext_awaddr_in_m2 = 32'h0000_3ddd;
        ext_awprot_in_m1 = 3;               ext_awprot_in_m2 = 7;
        ext_wdata_in_m1 = 144;              ext_wdata_in_m2 = 146;
        ext_wstrb_in_m1 = 7;                ext_wstrb_in_m2 = 6;
        ext_araddr_in_m1 = 32'h0000_3eee;   ext_araddr_in_m2 = 32'h0000_3fff;
        ext_arprot_in_m1 = 5;               ext_arprot_in_m2 = 9;
        ext_rdata_in_s2 = 148;              ext_rdata_in_s2 = 150;
        #50
        ext_awaddr_in_m1 = 32'h7777_7777;   ext_awaddr_in_m2 = 32'h8888_8888;
        ext_awprot_in_m1 = 0;               ext_awprot_in_m2 = 0;
        ext_wdata_in_m1 = 236;              ext_wdata_in_m2 = 234;
        ext_wstrb_in_m1 = 15;               ext_wstrb_in_m2 = 15;
        ext_araddr_in_m1 = 32'h9999_9999;   ext_araddr_in_m2 = 32'haaaa_aaaa;
        ext_arprot_in_m1 = 0;               ext_arprot_in_m2 = 0;
        ext_rdata_in_s2 = 235;              ext_rdata_in_s2 = 233;
        #500 $finish;
    end

endmodule
