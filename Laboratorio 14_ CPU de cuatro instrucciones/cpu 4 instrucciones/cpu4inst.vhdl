--Guillermo Del Rio B
--2112004585
--Ing en Computacion

library ieee;
use ieee.std_logic_1164.all;
use work.dl_bib.all;

entity cpu4inst is
  port (
    clock      :in  std_logic;
    inst       :in  std_logic_vector(7 downto 0);
    lcd        :out std_logic_vector(11 downto 0);
    display_r0 :out std_logic_vector(6 downto 0);
    display_r1 :out std_logic_vector(6 downto 0);
    display_r2 :out std_logic_vector(6 downto 0);
    display_r3 :out std_logic_vector(6 downto 0);
    display_t0 :out std_logic_vector(6 downto 0);
    display_t1 :out std_logic_vector(6 downto 0);
    led        :out std_logic;
    done       :out std_logic 
  ) ;
end cpu4inst ;

architecture arch of cpu4inst is
    signal bus_alam:std_logic_vector(3 downto 0);



begin

    ------ unidad de control del cpu de 4 instrucciones
    control0: control_cpu4inst
        port map(
             clk => ,
            inst => ,
               q => ,
            done => ,
            buss => 
        );
    
    ------ registro 0 y buffer 0
    reg0 :registro
        port map (
            clk => ,
            ent => ,
              h => ,
            sal =>
        );

    buffer0:buffer3e
        port map(
            ent => ,
              h => ,
            sal => 
        );

    ------ registro 1 y buffer 1
    reg1 :registro
    port map (
        clk => ,
        ent => ,
          h => ,
        sal =>
    );

    buffer1:buffer3e
    port map(
        ent => ,
          h => ,
        sal => 
    );
    
    ------ registro 2 y buffer 2
    reg2 :registro
    port map (
        clk => ,
        ent => ,
          h => ,
        sal =>
    );

    buffer2:buffer3e
    port map(
        ent => ,
          h => ,
        sal => 
    );

    ------ registro 3 y buffer 3
    reg3 :registro
    port map (
        clk => ,
        ent => ,
          h => ,
        sal =>
    );

    buffer3:buffer3e
    port map(
        ent => ,
          h => ,
        sal => 
    );

    ------- reg_temp_0   alu   reg_temp_1  y buffer4
    reg_temp_0 :registro
    port map (
        clk => ,
        ent => ,
          h => ,
        sal =>
    );

    alu0: alu
    port map (
        f   => ,
        a   => ,
        b   => ,
        res =>
        ) ;

    reg_temp_1 :registro
    port map (
        clk => ,
        ent => ,
          h => ,
        sal =>
        );  

    buffer4:buffer3e
    port map(
        ent => ,
          h => ,
        sal => 
    );


end architecture ; -- arch