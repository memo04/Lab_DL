library ieee;
use ieee.std_logic_1164.all;
package ac_bib is
    component registro is
        port(
            clk: in std_logic;
            ent: in std_logic_vector(3 downto 0);
            h:   in std_logic;
            sal: out std_logic_vector(3 downto 0)
        );
    end component registro;

    component buffer3e is
        port(
            ent: in std_logic_vector(3 downto 0);
            h: in std_logic;
            sal: out std_logic_vector(3 downto 0)
        );
    end component buffer3e;

    component control is
        port (
        clk: in std_logic ;
        swap: in std_logic ;
        t0: out std_logic ;
        t1: out std_logic ;
        t2: out std_logic ;
        done: out std_logic
        );
       end component control ;
end package ac_bib ;
        