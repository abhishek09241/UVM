class adder_sub_sequence_item extends uvm_sequence_item;

    parameter DATA_WIDTH = 4;
     
      rand logic [DATA_WIDTH - 1 : 0] data_in_1;
      rand logic [DATA_WIDTH - 1 : 0] data_in_2;
      rand logic                      enable;
      rand logic                      ctrl;
           logic [DATA_WIDTH    : 0]  data_out;

    // Factory registry of class and variables
    `uvm_object_utils_begin(adder_sub_sequence_item)
    `uvm_field_int         (data_in_1, UVM_ALL_ON | UVM_BIN)
    `uvm_field_int         (data_in_2, UVM_ALL_ON | UVM_BIN)
    `uvm_field_int         (enable,    UVM_ALL_ON | UVM_BIN)
    `uvm_field_int         (ctrl,     UVM_ALL_ON  | UVM_BIN)
    `uvm_field_int         (data_out,  UVM_ALL_ON | UVM_BIN)
    `uvm_object_utils_end

    function new(string name = "Adder_SUB_Sequence_item");
        super.new(name);
       // `uvm_info(get_full_name(),"This is the new function of Adder_SUB_Sequence_item",UVM_NONE)
    endfunction //new()
endclass //adder_sub_sequence_item extends uvm_sequence_item