--declaramos nuestro registros utilizando el estandar ieee para poder utilizar std_logic y std_logic_vector 
library ieee; --declaramos nuestra libreria
use ieee.std_logic_1164.all;

entity registro is
   port( 
       clk:in std_logic; --esto es igual al poner bit 
       ent:in std_logic_vector(3 downto 0); --lo mismo al poner bit_vector
       h:in std_logic;
       sal:out std_logic_vector(3 downto 0) );
end entity registro;

architecture beh of registro is
  constant maximo:integer:= 80000000;
  signal contador:integer range 0 to maximo := 0;
 
 begin
     process(clk) --recibimos la seÃ±al de reloj en la lista de sensibilidad
     begin
        if clk'event and clk='1' then
           if h = '1' then
              sal <= ent;
           end if;
		 end if;	
     end process;
  end architecture beh;

  