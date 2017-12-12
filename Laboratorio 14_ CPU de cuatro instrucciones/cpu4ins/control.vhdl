--declaramos nuestro control utilizando el estandar ieee para poder utilizar std_logic y std_logic_vector 
library ieee; --declaramos nuestra libreria
use ieee.std_logic_1164.all;

--describimos nuestro control en base al diagrama de estados que lleva una secuencia de corrimiento a la derecha 
entity control is
   port( 
       clk:in std_logic; --esto es igual al poner bit 
       inst:in std_logic_vector(7 downto 0);
       q:out std_logic_vector(12 downto 0);
       done:out std_logic;
       busw:out std_logic_vector(3 downto 0) );
end entity control;

architecture beh of control is
  constant maximo:integer:= 80000000; 
  signal ep,es:integer range 0 to 8 := 0;
  signal contador:integer range 0 to maximo := 0;
  --indica el codigo de operacion
  alias codop:std_logic_vector(1 downto 0) is inst(7 downto 6);
  --indica hacia donde van los datos de acuerdo a nuestros registros
  signal ayb:std_logic_vector(3 downto 0);
  --se asignan los datos restantes de nuestra entrada que es el numero que se va guardar en el primero registro y luego en el segundo
  alias datos:std_logic_vector(3 downto 0) is inst(5 downto 2);  

   alias hr:std_logic is inst(1);
begin
    ayb <= inst(5 downto 0) & inst(1 downto 0);

  --circuito secuencial es como si fueran nuestros flip-flops
 process(clk)
     begin
       if clk'event and clk='1' then
				ep <= es;
				end if;
   end process;

	  
     --circuito combinacional describir de acuerdo a nuestra maquina de estados

--         |              inst	            |
----------------------------------------------------
--	   |  7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- -------------------------------------------------
--     |  codop |  d a t o s    |  r d  |   
busw <= datos; --a esta instruccion le pasamos los datos
 process(ep)
  begin
       --ponemos nuestros estado que van del 0 al 12 
    case ep is
          when 0 =>    --decodificacion
          done <= '0';
          q <= "0000000000000";
            case codop is
                when "00" => --carga del estado 1 al 2
                es <= 1;
                when "01" => --move del estado 3 al 4
                es <= 3;
                when "10" => --hace suma se va al estado 5
                es <= 5;
                when "11" => --hace resta se va al estado 7
                es <= 7;
	        when others => --los demas estados
                es <= 0;
             end case;
            --instruccion carga
            when 1 => --carga
               case codop is --selecciona el registro de destino     
                 when "00" => 
                   q <= "1000000000001"; --0x1001
                  when "01" =>
                   q <= "0010000000001"; --0x0401
                  when "10" =>
                    q <= "0000100000001"; --0x0101
                  when "11" =>
                   q <= "0000001000001"; --0x0041
                  when others =>
                end case; --termina el estado 1 que es carga los datos
                  es <= 2; --nos dirigimos al estado 2
           
            when 2 => 
                  done <= '1';  --se habilita done por que alli termina
                  es <= 0; --y se regresa al estado 0
          

             --instruccion move
             --ahora vamos por estado 3
             when 3 => --move copia lo que hay guardado en un registro hacia otro registro

               case ayb is --selecciona el registro de destino que en este caso son el r2 y el r3 que es donde se va a mover los datos que hay en el r0 y r1
              when "0001" => 
                              q <= "0110000000000";
              when "0010" =>
                              q <= "0100100000000"; 
              when "0011" => 
                              q <= "0100001000000";
              when "0100" =>
                              q <= "1001000000000"; 
              when "0110" => 
                              q <= "0001100000000";
              when "0111" =>
                              q <= "0001001000000"; 
              when "1000" => 
                              q <= "1000010000000";
              when "1001" =>
                              q <= "0010010000000"; 
              when "1011" => 
                              q <= "0000011000000";
              when "1100" =>
                              q <= "1000000100000"; 
              when "1101" => 
                              q <= "0010000100000";
              when "1110" =>
                              q <= "0000100100000"; 
                  --when others =>
                end case; --termina el estado 3 que es mover los datos
                  es <= 4; --nos dirigimos al estado 4
           
            when 4 => 
                  done <= '1';  --se habilita done por que alli termina
                  es <= 0; --y se regresa al estado 0

             --instruccion suma
             --ahora vamos por estado 5
             when 5 => --ahora hacemos la suma en este caso los hacemos del r0 y r1 pero podriamos hacerlo de los r3 y r4 porque en esa parte movimos los registros
               case rb is --selecciona el registro de destino 
                 when "00" => 
                   q <= "0100000010000"; --0x0810
                  when "01" =>
                   q <= "0001000000000"; --0x0200
                  when others =>
                end case; --termina el estado 5 que es mover los datos
                  es <= 6; --nos dirigimos al estado 6
           
                 when 6 => 
                  done <= '1';  --se habilita done por que alli termina
                  es <= 0; --y se regresa al estado 0

          
           --instruccion resta
             --ahora vamos por estado 5
             when 7 => --ahora hacemos la resta igual traemos los mismo registros r0 y r1
        
              
               case rd is --selecciona el registro de destino      
                 when "00" => 
                   q <= "0100000010010"; --0x0810
                  when "01" =>
                   q <= "0001000000010"; --0x0202
                  when others =>
                 end case; --termina el estado 5 que es mover los datos
                  es <= 8; --nos dirigimos al estado 6    
       
                 when 8 => 
                  done <= '1';  --se habilita done por que alli termina
                  es <= 0; --y se regresa al estado 0   
       end case;
 
end process;
end architecture beh;
