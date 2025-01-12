class adder_sub_monitor extends uvm_monitor;
    `uvm_component_utils(adder_sub_monitor)
    parameter DATA_WIDTH =4; 
    adder_sub_sequence_item        adder_sub_sequence_item_handle;

    virtual adder_sub_interface #(.DATA_WIDTH(DATA_WIDTH)) adder_sub_vif;
     
     uvm_analysis_port #(adder_sub_sequence_item) monitor_port;

    function new(string name = "adder_sub_monitor", uvm_component parent);
        super.new(name,parent);
       // `uvm_info("","Hi, I'm new function of monitor class please create my handle in Agent class",UVM_NONE)

        monitor_port = new("monitor_port",this);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        //`uvm_info(get_full_name(),"I'm Build phase of adder_sub_monitor",UVM_NONE)
        if(!uvm_config_db#(virtual adder_sub_interface #(.DATA_WIDTH(DATA_WIDTH)))::get(this,"","INTERFACE_KEY",adder_sub_vif))
            `uvm_fatal(get_full_name(),"Oops I'm monitor who failed to get interface from top")
        else
            `uvm_info(get_full_name(),"Hurray I'm Monitor who get success while getting interface from top",UVM_DEBUG)
    endfunction

    task run_phase (uvm_phase phase);
    //    // `uvm_info(get_full_name(),"Hi I'm run phase of adder_sub_monitor class, you can write randomize here", UVM_NONE)
    //     repeat(2)begin
    //         adder_sub_sequence_item_handle  =  adder_sub_sequence_item::type_id::create("adder_sub_sequence_item_handle");
    //        // `uvm_info(get_full_name(),"Hi I'm printing before randomizing", UVM_NONE)
    //         void'(adder_sub_sequence_item_handle.randomize());
    //         //adder_sub_sequence_item_handle.print();
    //         monitor_port.write(adder_sub_sequence_item_handle);
    //        // `uvm_info(get_full_name(),"Hi I'm printing after randomizing", UVM_NONE)
    //     end
    forever begin
        if(adder_sub_vif.rst)begin
            monitor_data();
    end
    else begin
        `uvm_info(" ","Reset is driving zero!",UVM_NONE)
        @(posedge adder_sub_vif.clk);
    end
    end
        
    endtask  
    
    task  monitor_data();
        adder_sub_sequence_item_handle  = adder_sub_sequence_item::type_id::create("adder_sub_sequence_item_handle");
        if(adder_sub_vif.enable) begin
            @(posedge adder_sub_vif.clk);
                adder_sub_sequence_item_handle.data_in_1        =   adder_sub_vif.data_in_1;
                adder_sub_sequence_item_handle.data_in_2        =   adder_sub_vif.data_in_2;
                adder_sub_sequence_item_handle.enable           =   adder_sub_vif.enable;
                adder_sub_sequence_item_handle.ctrl             =   adder_sub_vif.ctrl;
                adder_sub_sequence_item_handle.data_out         =   adder_sub_vif.data_out;
                monitor_port.write(adder_sub_sequence_item_handle);
                //`uvm_info(" ","Monitor is displaying...",UVM_NONE)
               // adder_sub_sequence_item_handle.print();
        end
        else begin
            `uvm_info(" ","Monitor is not displaying...",UVM_NONE)
            @(posedge adder_sub_vif.clk);
        end
    endtask //
endclass //adder_sub_monitor extends uvm_monitor