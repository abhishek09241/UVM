class adder_sub_sequencer extends uvm_sequencer#(adder_sub_sequence_item);

    `uvm_component_utils(adder_sub_sequencer)
    function new(string name = "adder_sub_agent", uvm_component parent);
        super.new(name,parent);
       // `uvm_info("","Hi, I'm the new function of adder_sub_sequencer please create the handle of this class in agent class",UVM_NONE)
    endfunction //new()
endclass //adder_sub_sequencer extends uvm_sequencer
