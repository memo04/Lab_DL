library ieee;
use ieee.std_logic_1164.all;
use work.ac_bib.all

entity tb_cpuswap is
end tb_cpuswap;

architecture beh of ent is
    component cpuswap is
        port(
            clk: in std_logic;
            inst:in std_logic_vector(5 downto 0);
            done:out std_logic
        );
    end component cpuswap;
    signal clk: std_logic := '0';
    signal inst: std_logic_vector (5 downto 0) :="001010";
    signal done: std_logic;
begin
    u0:cpuswap
    port map(
        clk =>  clk,
        inst => inst,
        done => done
    );

    process
    begin
        wait for 10 ns;
            clk <= not clk;
    end process;

        process
        begin
            wait for 50 ns;
                inst <= "011011"; 
            wait for 50 ns;
                inst <= "100000";
            wait for 200 ns;
        end process ;
        
end architecture beh ; -- beh