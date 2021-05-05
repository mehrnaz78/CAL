library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        S               : in     vl_logic;
        mode            : in     vl_logic_vector(1 downto 0);
        Op_code         : in     vl_logic_vector(3 downto 0);
        WB_EN           : out    vl_logic;
        MEM_R_EN        : out    vl_logic;
        MEM_W_EN        : out    vl_logic;
        B               : out    vl_logic;
        out_S           : out    vl_logic;
        EXE_CMD         : out    vl_logic_vector(3 downto 0)
    );
end ControlUnit;
