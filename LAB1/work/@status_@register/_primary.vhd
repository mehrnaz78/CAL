library verilog;
use verilog.vl_types.all;
entity Status_Register is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Status_bits_in  : in     vl_logic_vector(3 downto 0);
        Status_bits     : out    vl_logic_vector(3 downto 0)
    );
end Status_Register;
