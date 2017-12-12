--Guillermo Del Rio B
--2112004585
--Ing en Computacion

library ieee;
use ieee.std_logic_1164.all;
use work.dl_bib_comp.all;
use work.dl_bib_fun.all;

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
    ------señales para el reloj maestro
    constant max:integer:= 50000000; 
    signal ciclos:integer range 0 to max;
    signal clk:std_logic:='0';

--                   palabra de control
----------------------------------------------------------------------
--	   | 12 | 11 | 10 | 9 | 8 | 7 | 6 | 5 |  4  | 3 | 2 |  1  |  0   |
--     |   r0    |   r1   |  r2   |  r3   |  t0 |   t1  |  f  | ctrl |                   
--     | r  | w  | r  | w | r | w | r | w |  r  | r | w | a\s |  w   |
----------------------------------------------------------------------
    signal h:std_logic_vector(12 downto 0);

    --  cable del buss 
    signal buss_alam:std_logic_vector(3 downto 0);
    --  cables de registros a buss
    signal r0_b0,r1_b1,r2_b2,r3_b3:std_logic_vector(3 downto 0);
    --  cables de los temp 1 y 2 alu y buss4
    signal temp0_alu,alu_temp1,temp1_b4:std_logic_vector(3 downto 0);
    --  cable de control a buss5
    signal cntl_b5:std_logic_vector(3 downto 0);


begin

------- señal de reloj
        process(clock)
        begin
        if clock'event and clock='1' then
            if ciclos < max then
                ciclos <= ciclos+1;
            else
                ciclos <= 0;
                clk<=not clk;
            end if; 
        end if;
        end process;

        led<=clk;

---------- se agregan los componentes
    ------ unidad de control del cpu de 4 instrucciones
    control0: control_cpu4inst
        port map(
             clk => clk,
            inst => inst,
               q => h,
            done => done,
            buss => cntl_b5
        );

        buffer5:buffer3e
        port map(
            ent => cntl_b5,
              h => h(0),
            sal => buss_alam
        );
    
    ------ registro 0 y buffer 0
    reg0 :registro
        port map (
            clk => clk,
            ent => buss_alam,
              h => h(12),
            sal => r0_b0
        );

    buffer0:buffer3e
        port map(
            ent => r0_b0,
              h => h(11),
            sal => buss_alam
        );

    ------ registro 1 y buffer 1
    reg1 :registro
    port map (
        clk => clk,
        ent => buss_alam,
          h => h(10),
        sal => r1_b1
    );

    buffer1:buffer3e
    port map(
        ent => r1_b1,
          h => h(9),
        sal => buss_alam
    );
    
    ------ registro 2 y buffer 2
    reg2 :registro
    port map (
        clk => clk,
        ent => buss_alam,
          h => h(8),
        sal => r2_b2
    );

    buffer2:buffer3e
    port map(
        ent => r2_b2,
          h => h(7),
        sal => buss_alam
    );

    ------ registro 3 y buffer 3
    reg3 :registro
    port map (
        clk => clk,
        ent => buss_alam,
          h => h(6),
        sal => r3_b3
    );

    buffer3:buffer3e
    port map(
        ent => r3_b3,
          h => h(5),
        sal => buss_alam
    );

    ------- reg_temp0   alu   reg_temp1  y buffer4
    reg_temp0 :registro
    port map (
        clk => clk,
        ent => buss_alam,
          h => h(4),
        sal => temp0_alu
    );

    alu0: alu
    port map (
        f   => h(1),
        a   => temp0_alu,
        b   => buss_alam,
        res => alu_temp1
        ) ;

    reg_temp1 :registro
    port map (
        clk => clk,
        ent => alu_temp1,
          h => h(3),
        sal => temp1_b4
        );  

    buffer4:buffer3e
    port map(
        ent => temp1_b4,
          h => h(2),
        sal => buss_alam
    );


end architecture ; -- arch