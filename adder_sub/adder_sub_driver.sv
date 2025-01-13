class adder_sub_driver extends uvm_driver#(adder_sub_sequence_item);

    `uvm_component_utils(adder_sub_driver)

    adder_sub_sequence_item         adder_sub_sequence_item_handle;
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

            adder_sub_sequence_item_handle  = adder_sub_sequence_item::type_id::create("adder_sequence_item_hamdle");
    endfunction

    task  run_phase(uvm_phase phase);
   // `uvm_info(get_full_name(),"Hello, I'm run_phase of adder_sub_driver class",UVM_NONE)
        // forever begin
        //     seq_item_port.get_next_item(adder_sub_sequence_item_handle);
        //     //adder_sub_sequence_item_handle.print();
        //     seq_item_port.item_done(adder_sub_sequence_item_handle);
        // end

            driver_data(adder_sub_sequence_item_handle);
    endtask //


    task  driver_data(adder_sub_sequence_item adder_sub_sequence_item_handle);

        forever begin 
            if(adder_sub_vif.rst)begin

        seq_item_port.get_next_item(adder_sub_sequence_item_handle);
        @(posedge adder_sub_vif.clk)
        adder_sub_vif.data_in_1                  <=      adder_sub_sequence_item_handle.data_in_1;
        adder_sub_vif.data_in_2                  <=      adder_sub_sequence_item_handle.data_in_2;
        adder_sub_vif.ctrl                       <=      adder_sub_sequence_item_handle.ctrl;
        adder_sub_vif.enable                     <=      1'b1;
        @(posedge adder_sub_vif.clk)
        adder_sub_vif.enable                     <=      1'b0;
        adder_sub_sequence_item_handle.data_out  <=      adder_sub_vif.data_out;
        seq_item_port.put_response(adder_sub_sequence_item_handle);
        rsp_port.write(adder_sub_sequence_item_handle);
        seq_item_port.item_done(adder_sub_sequence_item_handle);
        `uvm_info("","Data in driver displaying",UVM_NONE)
            adder_sub_sequence_item_handle.print();
        end
        else begin
                `uvm_info(" ","Reset is low!", UVM_NONE)
                adder_sub_vif.enable    =   1'b0;
                @(posedge adder_sub_vif.clk);
            end
        end
    endtask //
endclass //adder_sub_driver extends uvm_driver