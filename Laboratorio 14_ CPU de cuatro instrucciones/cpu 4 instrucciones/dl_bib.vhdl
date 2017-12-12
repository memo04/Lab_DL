--Guillermo Del Rio B
--2112004585
--Ing en Computacion

library ieee;
use ieee.std_logic_1164.all;
package dl_bib is
    component registro is
        port(
            clk: in std_logic;
            ent: in std_logic_vector(3 downto 0);
            h:   in std_logic;
            sal: out std_logic_vector(3 downto 0)
        );
    end component registro;

    component alu is
        port (
          f: in  std_logic;
          a: in  std_logic_vector(3 downto 0);
          b: in  std_logic_vector(3 downto 0);
          res: out std_logic_vector(3 downto 0)
        ) ;
      end component alu;

    component buffer3e is
        port(
            ent: in std_logic_vector(3 downto 0);
            h: in std_logic;
            sal: out std_logic_vector(3 downto 0)
        );
    end component buffer3e;

    component control_cpuswap is
        port (
        clk: in std_logic ;
        swap: in std_logic ;
        t0: out std_logic ;
        t1: out std_logic ;
        t2: out std_logic ;
        done: out std_logic
        );
       end component control_cpuswap;

       component control_cpu4inst is
        port (
            clk:in std_logic;
            inst:in std_logic_vector(7 downto 0);
            q:out std_logic_vector(12 downto 0);
            done:out std_logic;
            buss:out std_logic_vector(3 downto 0)
        );
       end component control_cpu4inst;
end package dl_bib ;
        