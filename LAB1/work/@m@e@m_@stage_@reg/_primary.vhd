library verilog;
use verilog.vl_types.all;
entity MEM_Stage_Reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        WB_EN_IN        : in     vl_logic;
        MEM_R_EN_IN     : in     vl_logic;
        ALU_Res_IN      : in     vl_logic_vector(31 downto 0);
        DM_IN           : in     vl_logic_vector(31 downto 0);
        Dest_IN         : in     vl_logic_vector(3 downto 0);
        WB_EN           : out    vl_logic;
        MEM_R_EN        : out    vl_logic;
        Dest            : out    vl_logic_vector(3 downto 0);
        ALU_Res         : out    vl_logic_vector(31 downto 0);
        DM              : out    vl_logic_vector(31 downto 0)
    );
end MEM_Stage_Reg;
