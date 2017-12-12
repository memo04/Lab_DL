--Guillermo Del Rio B
--2112004585
--Ing en Computacion
--biblioteca de puras funciones

library ieee;
use ieee.std_logic_1164.all;
    
package dl_bib_fun is

    --Declaracion de la funcion disp7seg
	function disp7seg( t :bit_vector (3 downto 0)) return bit_vector;
	--Delclaracion de la funcion dispOff
    function dispOff( t :bit_vector (3 downto 0)) return bit_vector;
    --Declaracion de la funcion ledsrojos
	function ledsrojos( t : bit_vector (3 downto 0)) return bit_vector;
    --funcion de sobrecarga
    function "+" (x,y: bit_vector(3 downto 0)) return bit_vector;

end package dl_bib_fun;


package body dl_bib_fun is 
--Definicion de la fucion disp7seg
function disp7seg( t :bit_vector (3 downto 0)) return bit_vector is
variable valret: bit_vector (6 downto 0);
begin 
case t is 
    when "0000" => valret := "1000000";
    when "0001" => valret := "1111001";
    when "0010" => valret := "0100100";
    when "0011" => valret := "0110000";
    when "0100" => valret := "0011001";
    when "0101" => valret := "0010010";
    when "0110" => valret := "0000010";
    when "0111" => valret := "1111000";
    when "1000" => valret := "0000000";
    when "1001" => valret := "0010000";
    when "1010" => valret := "0111111";
    when "1011" => valret := "0111111";
    when "1100" => valret := "0111111";
    when "1101" => valret := "0111111";
    when "1110" => valret := "0111111";
    when "1111" => valret := "0111111";
    end case; 
    return valret;

end function disp7seg;

--Definicion de la funcion dispOff
function dispOff( t :bit_vector (3 downto 0)) return bit_vector is
variable a: bit_vector(6 downto 0);
begin 
case t is 
    when "0000" => a := "1111111";
    when "0001" => a := "1111111";
    when "0010" => a := "1111111";
    when "0011" => a := "1111111";
    when "0100" => a := "1111111";
    when "0101" => a := "1111111";
    when "0110" => a := "1111111";
    when "0111" => a := "1111111";
    when "1000" => a := "1111111";
    when "1001" => a := "1111111";
    when "1010" => a := "1111111";
    when "1011" => a := "1111111";
    when "1100" => a := "1111111";
    when "1101" => a := "1111111";
    when "1110" => a := "1111111";
    when "1111" => a := "1111111";
    end case; 
    return a;

end function dispOff;

--definicion de la funcion ledsrojos
function ledsrojos( t :bit_vector (3 downto 0)) return bit_vector is
	variable b: bit_vector(8 downto 0);
begin
	case t is
		when "0000" => b := "000000000";
		when "0001" => b := "000000001";
		when "0010" => b := "000000010";
		when "0011" => b := "000000100";
		when "0100" => b := "000001000";
		when "0101" => b := "000010000";
		when "0110" => b := "000100000";
		when "0111" => b := "001000000";
		when "1000" => b := "010000000";
		when "1001" => b := "100000000";
		when "1010" => b := "111111111";
		when "1011" => b := "111111111";
		when "1100" => b := "111111111";
		when "1101" => b := "111111111";
		when "1110" => b := "111111111";
		when "1111" => b := "111111111";
		end case; 
		return b;
	end function ledsrojos;



function "+" (x,y: bit_vector(3 downto 0)) return bit_vector is
    variable suma: bit_vector(3 downto 0):= "0000";
    variable c_o, c_i: bit;
begin
    c_i:='0';
    for i in 0 to 3 loop
        suma(i):= x(i) xor y(i) xor c_i;
        c_o:= (x(i) and y(i)) or (x(i) and c_i)or(y(i) and c_i);
        c_i:= c_o;
    end loop;
    return suma;
end function "+";




end package body dl_bib_fun;	