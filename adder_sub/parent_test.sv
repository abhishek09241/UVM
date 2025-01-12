class parent_test extends uvm_test;

    `uvm_component_utils(parent_test)

    adder_sub_env   adder_sub_env_handle;

    function new(string name = "Parent_Test", uvm_component parent);
        super.new(name, parent);
      //  `uvm_info(" ","This is the new function  of parent test", UVM_NONE)
    endfunction //new()


    function void build_phase (uvm_phase phase);
        super.build_phase (phase);
        //`uvm_info(" ","This is the build phase of parent test", UVM_NONE);
        adder_sub_env_handle = adder_sub_env :: type_id :: create ("adder_sub_env_handle", this); 
    endfunction
endclass //parent_test extends uvm_test