class adder_sub_driver extends uvm_driver#(adder_sub_sequence_item);

    `uvm_component_utils(adder_sub_driver)
    parameter DATA_WIDTH =4; 
    virtual adder_sub_interface #(.DATA_WIDTH(DATA_WIDTH)) adder_sub_vif;
    function new(string name = "adder_sub_driver", uvm_component parent);
        super.new(name,parent);
      //  `uvm_info(get_full_name(),"Hi, I'm the new function of adder_sub_driver class please create my handle in agent class",UVM_NONE)
    endfunction //new()


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
       // `uvm_info(get_full_name(),"I'm Build phase of adder_sub_driver",UVM_NONE)
        if(!uvm_config_db#(virtual adder_sub_interface #(.DATA_WIDTH(DATA_WIDTH)))::get(this,"","INTERFACE_KEY",adder_sub_vif))
            `uvm_fatal(get_full_name(),"Oops I'm DRIVER who failed to get interface from top")
        else
            `uvm_info(get_full_name(),"Hurray I'm DRIVER who get success while getting interface from top",UVM_DEBUG)
    endfunction

endclass //adder_sub_driver extends uvm_driver