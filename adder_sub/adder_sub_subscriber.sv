class adder_sub_subscriber extends uvm_subscriber#(adder_sub_sequence_item);
    
    `uvm_component_utils(adder_sub_subscriber)
    uvm_analysis_imp#(adder_sub_sequence_item,adder_sub_subscriber)subscriber_monitor_port;

    function new(string name = "adder_sub_subscriber", uvm_component parent);
        super.new(name,parent);
       // `uvm_info("","This is the new function of adder_sub_subscriber", UVM_NONE)
       subscriber_monitor_port = new("monitor_port",this);
    endfunction //new()

    function void  write(adder_sub_sequence_item  t);
       // t.print();
       // `uvm_info(" ", "This is the write function of adder_sub_subscriber", UVM_NONE)
    endfunction

endclass //adder_sub_subscriber extends uvm_subscriber