library ieee;
use ieee.std_logic_1164.all;
use work.ac_bib.all;

entity cpuswap is
    port(
        clk: in std_logic;
        inst:in std_logic_vector(5 downto 0);
        done:out std_logic
    );
end cpuswap;

architecture beh of cpuswap is
    signal bus_alam:std_logic_vector(3 downto 0);
    signal r0_2_b0:std_logic_vector(3 downto 0);
    signal r1_2_b1:std_logic_vector(3 downto 0);
    signal rt_2_bt:std_logic_vector(3 downto 0);
    signal comp_2_reg0:std_logic;
    signal comp_2_reg1:std_logic;
    signal a_t0:std_logic;
    signal a_t1:std_logic;
    signal a_t2:std_logic;
    signal externo:std_logic;
    alias datos:std_logic_vector(3 downto 0) is inst(3 downto 0);
    alias cop:std_logic is inst(5);
    alias reg:std_logic is inst(4);

    begin
        externo <= not cop;
        comp_2_reg0 <= a_t1 or (not reg and externo);
        comp_2_reg1 <= a_t2 or reg;
        
        --registros
        r0:registro
        port map(
            clk => clk,
            ent => bus_alam,
            h => comp_2_reg0,
            sal => r0_2_b0  
        );
        
        r1:registro
        port map(
            clk => clk,
            ent => bus_alam,
            h => comp_2_reg0,
            sal => r1_2_b1  
        );

        rt:registro
        port map(
            clk => clk,
            ent => bus_alam,
            h => a_t0,
            sal => rt_2_bt  
        );   
        
        --buffers

        b0:buffer3e
        port map(
            ent => r0_2_b0,
            h => a_t0,
            sal => bus_alam
        );

        b1:buffer3e
        port map(
            ent => r1_2_b1,
            h => a_t1,
            sal => bus_alam
        );

        bt:buffer3e
        port map(
            ent => rt_2_bt,
            h => a_t2,
            sal => bus_alam
        );

        be:buffer3e
        port map(
            ent => datos,
            h => externo,
            sal => bus_alam
        );

        --unidad de control
        ctl:control
        port map(
            clk => clk,
            swap => cop,
            t0 => a_t0,
            ti => a_t1,
            t2 => a_t2,
            done => done
        );

        end architecture beh;
