library verilog;
use verilog.vl_types.all;
entity WB_Stage is
    port(
        ALU_Result      : in     vl_logic_vector(31 downto 0);
        MEM_Result      : in     vl_logic_vector(31 downto 0);
        MEM_R_EN        : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end WB_Stage;
