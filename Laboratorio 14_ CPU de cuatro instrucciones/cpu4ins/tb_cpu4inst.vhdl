-- declaramos nuestra libreria ieee para poder utilizar std_logic y std_logic_vector 
library ieee; --declaramos nuestra libreria
use ieee.std_logic_1164.all;
use work.dl_bib.all;

entity tb_cpu4inst is
end entity tb_cpu4inst;

architecture beh of tb_cpu4inst is 

component cpu4inst is
   port( 
       clk:in std_logic; --esto es igual al poner bit 
       inst:in std_logic_vector(7 downto 0); --lo mismo al poner bit_vector
       done:out std_logic );
end component cpu4inst;

signal botonclk:std_logic:='0';
signal botoninst:std_logic_vector(7 downto 0):="00000000";
signal done:std_logic;

begin
  u0:cpu4inst
    port map(
             clk => botonclk,
             inst => botoninst,
             done => done   );

estimuloclk:process  --estimulo para la señal de reloj
  begin
     wait for 10 ns;
       botonclk <= not botonclk;
  end process estimuloclk;

estimulobotoninst:process --estimulo para las 2 entradas de datos 
  begin 
     wait for 35 ns; --mis primeras 2 entradas
     botoninst <= "00111000"; 
     wait for 35 ns;
     botoninst <= "00101001";
     wait for 35 ns; --mis primeras 2 reg de dire
     botoninst <= "01000000";
     wait for 35 ns;
     botoninst <= "01000001";
     wait for 35 ns; --direccion de suma 
     botoninst <= "10000000";
     wait for 35 ns;
     botoninst <= "10000001";
     wait for 35 ns; --direccion de resta
     botoninst <= "11000000";
     wait for 35 ns;
     botoninst <= "11000001";
  end process estimulobotoninst;


end architecture beh;
