class adder_sub_env extends uvm_env;
    `uvm_component_utils(adder_sub_env)

    adder_sub_scoreboard    adder_sub_scoreboard_handle;
    adder_sub_subscriber    adder_sub_subscriber_handle;
    adder_sub_agent         adder_sub_agent_handle;

    function new(string name = "adder_sub_env", uvm_component parent);
        super.new(name,parent);
      //  `uvm_info(" ","This is the New function of environment class", UVM_NONE)
    endfunction //new()


    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
       // `uvm_info(" ","This is the build phase of environment class", UVM_NONE)
        adder_sub_scoreboard_handle = adder_sub_scoreboard::type_id::create("adder_sub_scoreboard_handle",this);
        adder_sub_subscriber_handle = adder_sub_subscriber::type_id::create("adder_sub_subscriber_handle",this);
        adder_sub_agent_handle      = adder_sub_agent     ::type_id::create("adder_sub_agent_handle",this);
    endfunction

    function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);
       // `uvm_info(" ","I'm connect phase of adder_sub_env", UVM_NONE)
        adder_sub_agent_handle.adder_sub_monitor_handle.monitor_port.connect(adder_sub_scoreboard_handle.scoreboard_monitor_port);
        adder_sub_agent_handle.adder_sub_monitor_handle.monitor_port.connect(adder_sub_subscriber_handle.subscriber_monitor_port);
        //adder_sub_agent_handle.adder_sub_driver_handle.print();
        //adder_sub_agent_handle.adder_sub_sequencer_handle.print();
    endfunction
endclass //adder_sub_env