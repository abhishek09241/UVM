class adder_sub_scoreboard extends uvm_scoreboard;
     `uvm_component_utils(adder_sub_scoreboard)

      uvm_analysis_imp#(adder_sub_sequence_item,adder_sub_scoreboard) scoreboard_monitor_port;
    function new(string name = "adder_sub_scoreboard", uvm_component parent);
        super.new(name,parent);
       // `uvm_info(" ","This is the nuw function of class adder_sub_scoreboard",UVM_NONE)
        scoreboard_monitor_port = new("scoreboard_monitor_port", this);
    endfunction //new()

    function void write(adder_sub_sequence_item adder_sub_sequence_item_handle);
       // `uvm_info(get_full_name(),"I'm here to write in the scoreboard",UVM_NONE)
       // adder_sub_sequence_item_handle.print();
    endfunction


endclass //adder_sub_scoreboard extends uvm_scoreboard