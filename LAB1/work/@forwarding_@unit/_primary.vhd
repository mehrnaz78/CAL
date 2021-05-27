library verilog;
use verilog.vl_types.all;
entity Forwarding_Unit is
    port(
        WB_WB_EN        : in     vl_logic;
        MEM_WB_EN       : in     vl_logic;
        WB_Dest         : in     vl_logic_vector(3 downto 0);
        MEM_Dest        : in     vl_logic_vector(3 downto 0);
        EXE_src1        : in     vl_logic_vector(3 downto 0);
        EXE_src2        : in     vl_logic_vector(3 downto 0);
        Sel_src1        : out    vl_logic_vector(1 downto 0);
        Sel_src2        : out    vl_logic_vector(1 downto 0)
    );
end Forwarding_Unit;
