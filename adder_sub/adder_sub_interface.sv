`ifndef adder_sub_interface_
 `define adder_sub_interface_

interface adder_sub_interface #(parameter DATA_WIDTH = 4);
      logic [DATA_WIDTH - 1 : 0] data_in_1;
      logic [DATA_WIDTH - 1 : 0] data_in_2;
      logic                      enable;
      logic                      ctrl;
      logic                      clk;
      logic                      rst;
      logic [DATA_WIDTH    : 0]  data_out;

    
endinterface //adder_sub_interface
`endif 