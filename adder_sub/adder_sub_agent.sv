class adder_sub_agent extends uvm_agent;

    adder_sub_sequencer         adder_sub_sequencer_handle;
    adder_sub_monitor           adder_sub_monitor_handle;
    adder_sub_driver            adder_sub_driver_handle;
   adder_sub_sequence_item     adder_sub_sequence_item_handle;

    `uvm_component_utils(adder_sub_agent)

    function new (string name = "adder_sub_agent", uvm_component parent);
        super.new(name,parent);
      //  `uvm_info(" ","Hi, I'm the new function of adder_sub_agent_class please create handle of this class to the environment", UVM_NONE)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
      //  `uvm_info("","Hi, I'm the build_phase of adder_sub_agent_class please allocate all the child class of agent here", UVM_NONE)
        adder_sub_sequencer_handle      = adder_sub_sequencer       ::type_id::create("adder_sub_sequencer_handle",this);
        adder_sub_monitor_handle        = adder_sub_monitor         ::type_id::create("adder_sub_monitor_handle",this);
        adder_sub_driver_handle         = adder_sub_driver          ::type_id::create("adder_sub_driver_handle",this);

        adder_sub_sequence_item_handle  = adder_sub_sequence_item   ::type_id::create("adder_sub_sequence_item_handle");
    endfunction


    function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_full_name(),"I'm the connect phase of adder_sub_agent class ..",UVM_NONE)
       adder_sub_driver_handle.seq_item_port.connect(adder_sub_sequencer_handle.seq_item_export);
       //adder_sub_sequence_item_handle.print();
      
    endfunction

endclass : adder_sub_agent