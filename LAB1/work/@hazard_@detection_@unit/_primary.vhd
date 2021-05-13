library verilog;
use verilog.vl_types.all;
entity Hazard_Detection_Unit is
    port(
        src1            : in     vl_logic_vector(3 downto 0);
        src2            : in     vl_logic_vector(3 downto 0);
        Exe_Dest        : in     vl_logic_vector(3 downto 0);
        Exe_WB_EN       : in     vl_logic;
        Mem_Dest        : in     vl_logic_vector(3 downto 0);
        Mem_WB_EN       : in     vl_logic;
        two_source      : in     vl_logic;
        Hazard_Detected : out    vl_logic
    );
end Hazard_Detection_Unit;
