class adder_sub_sequence extends uvm_sequence#(adder_sub_sequence_item);

adder_sub_sequence_item         adder_sub_sequence_item_handle;
`uvm_object_utils(adder_sub_sequence)

    function new(string name = "adder_sub_sequence");
    super.new(name);
    `uvm_info(get_full_name(),"Hi, I'm the new function of adder_sub_sequence",UVM_NONE)
    endfunction //new()

    task body();
        `uvm_info(get_full_name(),"Hi I'm the body task of adder_sub_sequence..",UVM_NONE)
        repeat(1) begin
            adder_sub_sequence_item_handle  = adder_sub_sequence_item::type_id::create("adder_sub_sequence_item_handle");
            start_item(adder_sub_sequence_item_handle);
            assert(adder_sub_sequence_item_handle.randomize());
            adder_sub_sequence_item_handle.print();
            finish_item(adder_sub_sequence_item_handle);
        end
    endtask //
endclass //adder_sub_sequence extends uvm_sequence