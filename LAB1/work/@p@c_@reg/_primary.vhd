library verilog;
use verilog.vl_types.all;
entity PC_Reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        freeze          : in     vl_logic;
        PC_in           : in     vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0)
    );
end PC_Reg;
