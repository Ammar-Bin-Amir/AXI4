module handshaking_xbar_2x2 (
    input clk,
    input rst,
    // Master 1
    input [7:0] data_out_m1,
    input valid_out_m1,
    output reg ready_in_m1,
    // Master 2
    input [7:0] data_out_m2,
    input valid_out_m2,
    output reg ready_in_m2,
    // Slave 1
    output reg [7:0] data_in_s1,
    output reg valid_in_s1,
    input ready_out_s1,
    // Slave 2
    output reg [7:0] data_in_s2,
    output reg valid_in_s2,
    input ready_out_s2
);

    localparam FIRST_PRIORITY = 0;
    localparam SECOND_PRIORITY = 1;
    
    reg current_state = 0, next_state;
    
    always @(posedge clk) begin
        if (!rst) begin
            current_state <= 0;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(posedge clk) begin
        case (current_state)
            FIRST_PRIORITY: begin
                if (data_out_m1 >= 8'h20 && data_out_m1 <= 8'h2f) begin
                    data_in_s1 <= data_out_m1;
                    valid_in_s1 <= valid_out_m1;
                    ready_in_m1 <= ready_out_s1;
                end
                else if (data_out_m2 >= 8'h20 && data_out_m2 <= 8'h2f) begin
                    data_in_s1 <= data_out_m2;
                    valid_in_s1 <= valid_out_m2;
                    ready_in_m2 <= ready_out_s1;
                end
                else if (data_out_m1 >= 8'h30 && data_out_m1 <= 8'h3f) begin
                    data_in_s2 <= data_out_m1;
                    valid_in_s2 <= valid_out_m1;
                    ready_in_m1 <= ready_out_s2;
                end
                else if (data_out_m2 >= 8'h30 && data_out_m2 <= 8'h3f) begin
                    data_in_s2 <= data_out_m2;
                    valid_in_s2 <= valid_out_m2;
                    ready_in_m2 <= ready_out_s2;
                end
                next_state <= SECOND_PRIORITY;
            end
            SECOND_PRIORITY: begin
                if (data_out_m1 >= 8'h20 && data_out_m1 <= 8'h2f && valid_in_s1 && ready_in_m1) begin
                    if (data_out_m2 >= 8'h20 && data_out_m2 <= 8'h2f) begin
                        data_in_s1 <= data_out_m2;
                        valid_in_s1 <= valid_out_m2;
                        ready_in_m2 <= ready_out_s1;
                    end
                end
                if (data_out_m1 >= 8'h30 && data_out_m1 <= 8'h3f && valid_in_s2 && ready_in_m1) begin
                    if (data_out_m2 >= 8'h30 && data_out_m2 <= 8'h3f) begin
                        data_in_s2 <= data_out_m2;
                        valid_in_s2 <= valid_out_m2;
                        ready_in_m2 <= ready_out_s2;
                    end
                end
                next_state <= FIRST_PRIORITY;
            end
            // default: 
        endcase
    end
    
endmodule