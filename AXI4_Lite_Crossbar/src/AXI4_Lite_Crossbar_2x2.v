module axi4_lite_crossbar_2x2 (
    input aclk,
    input aresetn,
    // Write Address Channel
    // Master 1
    input [31:0] awaddr_out_m1,
    input [2:0] awprot_out_m1,
    input awvalid_out_m1,
    output reg awready_in_m1,
    // Master 2
    input [31:0] awaddr_out_m2,
    input [2:0] awprot_out_m2,
    input awvalid_out_m2,
    output reg awready_in_m2,
    // Slave 1
    output reg [31:0] awaddr_in_s1,
    output reg [2:0] awprot_in_s1,
    output reg awvalid_in_s1,
    input awready_out_s1,
    // Slave 2
    output reg [31:0] awaddr_in_s2,
    output reg [2:0] awprot_in_s2,
    output reg awvalid_in_s2,
    input awready_out_s2,
    // Write Data Channel
    // Master 1
    input [31:0] wdata_out_m1,
    input [3:0] wstrb_out_m1,
    input wvalid_out_m1,
    output reg wready_in_m1,
    // Master 2
    input [31:0] wdata_out_m2,
    input [3:0] wstrb_out_m2,
    input wvalid_out_m2,
    output reg wready_in_m2,
    // Slave 1
    output reg [31:0] wdata_in_s1,
    output reg [3:0] wstrb_in_s1,
    output reg wvalid_in_s1,
    input wready_out_s1,
    // Slave 2
    output reg [31:0] wdata_in_s2,
    output reg [3:0] wstrb_in_s2,
    output reg wvalid_in_s2,
    input wready_out_s2,
    // Write Response Channel
    // Master 1
    output reg [1:0] bresp_in_m1,
    output reg bvalid_in_m1,
    input bready_out_m1,
    // Master 2
    output reg [1:0] bresp_in_m2,
    output reg bvalid_in_m2,
    input bready_out_m2,
    // Slave 1
    input [1:0] bresp_out_s1,
    input bvalid_out_s1,
    output reg bready_in_s1,
    // Slave 2
    input [1:0] bresp_out_s2,
    input bvalid_out_s2,
    output reg bready_in_s2,
    // Read Address Channel
    // Master 1
    input [31:0] araddr_out_m1,
    input [2:0] arprot_out_m1,
    input arvalid_out_m1,
    output reg arready_in_m1,
    // Master 2
    input [31:0] araddr_out_m2,
    input [2:0] arprot_out_m2,
    input arvalid_out_m2,
    output reg arready_in_m2,
    // Slave 1
    output reg [31:0] araddr_in_s1,
    output reg [2:0] arprot_in_s1,
    output reg arvalid_in_s1,
    input arready_out_s1,
    // Slave 2
    output reg [31:0] araddr_in_s2,
    output reg [2:0] arprot_in_s2,
    output reg arvalid_in_s2,
    input arready_out_s2,
    // Read Data Channel
    // Master 1
    output reg [31:0] rdata_in_m1,
    output reg rvalid_in_m1,
    input rready_out_m1,
    output reg [1:0] rresp_in_m1,
    // Master 2
    output reg [31:0] rdata_in_m2,
    output reg rvalid_in_m2,
    input rready_out_m2,
    output reg [1:0] rresp_in_m2,
    // Slave 1
    input [31:0] rdata_out_s1,
    input rvalid_out_s1,
    output reg rready_in_s1,
    input [1:0] rresp_out_s1,
    // Slave 2
    input [31:0] rdata_out_s2,
    input rvalid_out_s2,
    output reg rready_in_s2,
    input [1:0] rresp_out_s2
);
    
    localparam FIRST_PRIORITY = 0;
    localparam SECOND_PRIORITY = 1;

    reg current_state = 0, next_state;

    always @(posedge aclk) begin
        if (!aresetn) begin
            current_state <= 0;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(posedge aclk) begin
        case (current_state)
            FIRST_PRIORITY: begin
                if (awaddr_out_m1 >= 32'h0000_2000 && awaddr_out_m1 <= 32'h0000_2fff) begin
                    awaddr_in_s1 <= awaddr_out_m1;
                    awprot_in_s1 <= awprot_out_m1;
                    awvalid_in_s1 <= awvalid_out_m1;
                    awready_in_m1 <= awready_out_s1;
                    wdata_in_s1 <= wdata_out_m1;
                    wstrb_in_s1 <= wstrb_out_m1;
                    wvalid_in_s1 <= wvalid_out_m1;
                    wready_in_m1 <= wready_out_s1;
                    bresp_in_m1 <= bresp_out_s1;
                    bvalid_in_m1 <= bvalid_out_s1;
                    bready_in_s1 <= bready_out_m1;
                end
                else if (awaddr_out_m2 >= 32'h0000_2000 && awaddr_out_m2 <= 32'h0000_2fff) begin
                    awaddr_in_s1 <= awaddr_out_m2;
                    awprot_in_s1 <= awprot_out_m2;
                    awvalid_in_s1 <= awvalid_out_m2;
                    awready_in_m2 <= awready_out_s1;
                    wdata_in_s1 <= wdata_out_m2;
                    wstrb_in_s1 <= wstrb_out_m2;
                    wvalid_in_s1 <= wvalid_out_m2;
                    wready_in_m2 <= wready_out_s1;
                    bresp_in_m2 <= bresp_out_s1;
                    bvalid_in_m2 <= bvalid_out_s1;
                    bready_in_s1 <= bready_out_m2;
                end
                if (awaddr_out_m1 >= 32'h0000_3000 && awaddr_out_m1 <= 32'h0000_3fff) begin
                    awaddr_in_s2 <= awaddr_out_m1;
                    awprot_in_s2 <= awprot_out_m1;
                    awvalid_in_s2 <= awvalid_out_m1;
                    awready_in_m1 <= awready_out_s2;
                    wdata_in_s2 <= wdata_out_m1;
                    wstrb_in_s2 <= wstrb_out_m1;
                    wvalid_in_s2 <= wvalid_out_m1;
                    wready_in_m1 <= wready_out_s2;
                    bresp_in_m1 <= bresp_out_s2;
                    bvalid_in_m1 <= bvalid_out_s2;
                    bready_in_s2 <= bready_out_m1;
                end
                else if (awaddr_out_m2 >= 32'h0000_3000 && awaddr_out_m2 <= 32'h0000_3fff) begin
                    awaddr_in_s2 <= awaddr_out_m2;
                    awprot_in_s2 <= awprot_out_m2;
                    awvalid_in_s2 <= awvalid_out_m2;
                    awready_in_m2 <= awready_out_s2;
                    wdata_in_s2 <= wdata_out_m2;
                    wstrb_in_s2 <= wstrb_out_m2;
                    wvalid_in_s2 <= wvalid_out_m2;
                    wready_in_m2 <= wready_out_s2;
                    bresp_in_m2 <= bresp_out_s2;
                    bvalid_in_m2 <= bvalid_out_s2;
                    bready_in_s2 <= bready_out_m2;
                end
                next_state <= SECOND_PRIORITY;
            end
            SECOND_PRIORITY: begin
                if (awaddr_out_m1 >= 32'h0000_2000 && awaddr_out_m1 <= 32'h0000_2fff && bvalid_in_m1 && bready_in_s1) begin
                    if (awaddr_out_m2 >= 32'h0000_2000 && awaddr_out_m2 <= 32'h0000_2fff) begin
                        awaddr_in_s1 <= awaddr_out_m2;
                        awprot_in_s1 <= awprot_out_m2;
                        awvalid_in_s1 <= awvalid_out_m2;
                        awready_in_m2 <= awready_out_s1;
                        wdata_in_s1 <= wdata_out_m2;
                        wstrb_in_s1 <= wstrb_out_m2;
                        wvalid_in_s1 <= wvalid_out_m2;
                        wready_in_m2 <= wready_out_s1;
                        bresp_in_m2 <= bresp_out_s1;
                        bvalid_in_m2 <= bvalid_out_s1;
                        bready_in_s1 <= bready_out_m2; 
                    end
                end
                if (awaddr_out_m1 >= 32'h0000_3000 && awaddr_out_m1 <= 32'h0000_3fff && bvalid_in_m1 && bready_in_s2) begin
                    if (awaddr_out_m2 >= 32'h0000_3000 && awaddr_out_m2 <= 32'h0000_3fff) begin
                        awaddr_in_s2 <= awaddr_out_m2;
                        awprot_in_s2 <= awprot_out_m2;
                        awvalid_in_s2 <= awvalid_out_m2;
                        awready_in_m2 <= awready_out_s2;
                        wdata_in_s2 <= wdata_out_m2;
                        wstrb_in_s2 <= wstrb_out_m2;
                        wvalid_in_s2 <= wvalid_out_m2;
                        wready_in_m2 <= wready_out_s2;
                        bresp_in_m2 <= bresp_out_s2;
                        bvalid_in_m2 <= bvalid_out_s2;
                        bready_in_s2 <= bready_out_m2;
                    end
                end
                next_state <= FIRST_PRIORITY;
            end
            // default: 
        endcase
    end

    always @(posedge aclk) begin
        case (current_state)
            FIRST_PRIORITY: begin
                if (araddr_out_m1 >= 32'h0000_2000 && araddr_out_m1 <= 32'h0000_2fff) begin
                    araddr_in_s1 <= araddr_out_m1;
                    arprot_in_s1 <= arprot_out_m1;
                    arvalid_in_s1 <= arvalid_out_m1;
                    arready_in_m1 <= arready_out_s1;
                    rdata_in_m1 <= rdata_out_s1;
                    rvalid_in_m1 <= rvalid_out_s1;
                    rready_in_s1 <= rready_out_m1;
                    rresp_in_m1 <= rresp_out_s1;
                end
                else if (araddr_out_m2 >= 32'h0000_2000 && araddr_out_m2 <= 32'h0000_2fff) begin
                    araddr_in_s1 <= araddr_out_m2;
                    arprot_in_s1 <= arprot_out_m2;
                    arvalid_in_s1 <= arvalid_out_m2;
                    arready_in_m2 <= arready_out_s1;
                    rdata_in_m2 <= rdata_out_s1;
                    rvalid_in_m2 <= rvalid_out_s1;
                    rready_in_s1 <= rready_out_m2;
                    rresp_in_m2 <= rresp_out_s1;
                end
                if (araddr_out_m1 >= 32'h0000_3000 && araddr_out_m1 <= 32'h0000_3fff) begin
                    araddr_in_s2 <= araddr_out_m1;
                    arprot_in_s2 <= arprot_out_m1;
                    arvalid_in_s2 <= arvalid_out_m1;
                    arready_in_m1 <= arready_out_s2;
                    rdata_in_m1 <= rdata_out_s2;
                    rvalid_in_m1 <= rvalid_out_s2;
                    rready_in_s2 <= rready_out_m1;
                    rresp_in_m1 <= rresp_out_s2;
                end
                else if (araddr_out_m2 >= 32'h0000_3000 && araddr_out_m2 <= 32'h0000_3fff) begin
                    araddr_in_s2 <= araddr_out_m2;
                    arprot_in_s2 <= arprot_out_m2;
                    arvalid_in_s2 <= arvalid_out_m2;
                    arready_in_m2 <= arready_out_s2;
                    rdata_in_m2 <= rdata_out_s2;
                    rvalid_in_m2 <= rvalid_out_s2;
                    rready_in_s2 <= rready_out_m2;
                    rresp_in_m2 <= rresp_out_s2;
                end
                next_state <= SECOND_PRIORITY;
            end
            SECOND_PRIORITY: begin
                if (araddr_out_m1 >= 32'h0000_2000 && araddr_out_m1 <= 32'h0000_2fff && rvalid_in_m1 && rready_in_s1) begin
                    if (araddr_out_m2 >= 32'h0000_2000 && araddr_out_m2 <= 32'h0000_2fff) begin
                        araddr_in_s1 <= araddr_out_m2;
                        arprot_in_s1 <= arprot_out_m2;
                        arvalid_in_s1 <= arvalid_out_m2;
                        arready_in_m2 <= arready_out_s1;
                        rdata_in_m2 <= rdata_out_s1;
                        rvalid_in_m2 <= rvalid_out_s1;
                        rready_in_s1 <= rready_out_m2;
                        rresp_in_m2 <= rresp_out_s1;
                    end
                end
                if (araddr_out_m1 >= 32'h0000_3000 && araddr_out_m1 <= 32'h0000_3fff && rvalid_in_m1 && rready_in_s2) begin
                    if (araddr_out_m2 >= 32'h0000_3000 && araddr_out_m2 <= 32'h0000_3fff) begin
                        araddr_in_s2 <= araddr_out_m2;
                        arprot_in_s2 <= arprot_out_m2;
                        arvalid_in_s2 <= arvalid_out_m2;
                        arready_in_m2 <= arready_out_s2;
                        rdata_in_m2 <= rdata_out_s2;
                        rvalid_in_m2 <= rvalid_out_s2;
                        rready_in_s2 <= rready_out_m2;
                        rresp_in_m2 <= rresp_out_s2;
                    end
                end
                next_state <= FIRST_PRIORITY;
            end
            // default: 
        endcase
    end

endmodule