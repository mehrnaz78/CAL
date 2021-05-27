library verilog;
use verilog.vl_types.all;
entity EXE_Stage is
    port(
        clk             : in     vl_logic;
        EXE_CMD         : in     vl_logic_vector(3 downto 0);
        sel_src1        : in     vl_logic_vector(1 downto 0);
        sel_src2        : in     vl_logic_vector(1 downto 0);
        MEM_R_EN        : in     vl_logic;
        MEM_W_EN        : in     vl_logic;
        PC              : in     vl_logic_vector(31 downto 0);
        Val_Rn          : in     vl_logic_vector(31 downto 0);
        Val_Rm_IN       : in     vl_logic_vector(31 downto 0);
        ALU_res_MEM     : in     vl_logic_vector(31 downto 0);
        WB_value        : in     vl_logic_vector(31 downto 0);
        imm             : in     vl_logic;
        Shift_operand   : in     vl_logic_vector(11 downto 0);
        Signed_imm_24   : in     vl_logic_vector(23 downto 0);
        carry           : in     vl_logic;
        ALU_res         : out    vl_logic_vector(31 downto 0);
        Branch_Address  : out    vl_logic_vector(31 downto 0);
        Val_Rm          : out    vl_logic_vector(31 downto 0);
        Status_bits     : out    vl_logic_vector(3 downto 0)
    );
end EXE_Stage;
