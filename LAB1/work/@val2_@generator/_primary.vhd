library verilog;
use verilog.vl_types.all;
entity Val2_Generator is
    port(
        imm             : in     vl_logic;
        Shift_operand   : in     vl_logic_vector(11 downto 0);
        Rm_Val          : in     vl_logic_vector(31 downto 0);
        EXE             : in     vl_logic_vector(3 downto 0);
        Val2            : out    vl_logic_vector(31 downto 0)
    );
end Val2_Generator;
