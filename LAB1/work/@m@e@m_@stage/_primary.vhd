library verilog;
use verilog.vl_types.all;
entity MEM_Stage is
    port(
        clk             : in     vl_logic;
        WB_EN_IN        : in     vl_logic;
        MEM_R_EN_IN     : in     vl_logic;
        MEM_W_EN        : in     vl_logic;
        Dest_IN         : in     vl_logic_vector(3 downto 0);
        ALU_Res_IN      : in     vl_logic_vector(31 downto 0);
        Val_Rm          : in     vl_logic_vector(31 downto 0);
        WB_EN           : out    vl_logic;
        MEM_R_EN        : out    vl_logic;
        ALU_Res         : out    vl_logic_vector(31 downto 0);
        DM_out          : out    vl_logic_vector(31 downto 0);
        Dest            : out    vl_logic_vector(3 downto 0)
    );
end MEM_Stage;
