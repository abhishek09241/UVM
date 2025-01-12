module adder_sub #(parameter DATA_WIDTH = 4) (
    input  logic [DATA_WIDTH - 1 : 0] data_in_1,
    input  logic [DATA_WIDTH - 1 : 0] data_in_2,
    input  logic                      enable,
    input  logic                      ctrl,
    input  logic                      clk,
    input  logic                      rst,
    output logic [DATA_WIDTH    : 0]  data_out
);


always @(posedge clk) begin
    if(!rst)
        begin
            data_out <= 5'b0;
        end
    else begin
        case ({enable, ctrl})
            2'b11: data_out <= data_in_1 + data_in_2;
            2'b10: data_out <= data_in_1 - data_in_2;
        endcase
    end
end
endmodule