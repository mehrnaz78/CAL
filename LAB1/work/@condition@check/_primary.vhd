library verilog;
use verilog.vl_types.all;
entity ConditionCheck is
    port(
        cond            : in     vl_logic_vector(3 downto 0);
        status          : in     vl_logic_vector(3 downto 0);
        o               : out    vl_logic
    );
end ConditionCheck;
