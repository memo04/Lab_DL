entity nombre is
port(
    clk:in bit;  
    led:out bit;  
    slcd: out bit_vector(11 downto 0) 
    );
end entity nombre;

architecture beh of nombre is
    constant maximo:integer:= 500000;  
    constant max:integer:=50000000;
    signal contador:integer range 0 to maximo;
    signal contador1:integer range 0 to max;
    signal ep,es:integer range 0 to 15;
    signal interna:bit:='0';--8
    signal lcd:bit_vector(11 downto 0):="000000000000";

	
 begin 

   process(clk)--reloj de display
      begin
       if clk'event and clk='1' then
           
            if contador < maximo then
			contador <= contador+1;
			else 
			contador <= 0;
			ep<=es;
			end if;
       end if; 
     end process;

  process(clk)--reloj de led
      begin
       if clk'event and clk='1' then
           
            if contador1 < max then
			contador1 <= contador1+1;
			else 
			contador1 <= 0;
			interna<=not interna;
			end if;
       end if; 
     end process;
     
      
 led<=interna;
slcd<=lcd;

	process(ep,lcd)
	begin 
	
	case ep is
	when 0=>
	es<=1;
	lcd(11 downto 0)<="000000000000";	
	
	when 1=>
	es<=2;
	lcd(11 downto 0)<="100000111000";
	
	when 2=>
	es<=3;
	lcd(11 downto 0)<="110000111000";
	
	when 3=>
	es<=4;
	lcd(11 downto 0)<="100000000110";

	when 4=>
	es<=5;
	lcd(11 downto 0)<="110000000110";	
	
	when 5=>
	es<=6;
	lcd(11 downto 0)<="100000001111";	
		
	when 6=>
	es<=7;
	lcd(11 downto 0)<="110000001111";
		
	when 7=>
	es<=8;
	lcd(11 downto 0)<="100001010000";	--u
	
	
	when 8=>
	es<=9;
	lcd(11 downto 0)<="111001010000";	

	when 9=>
	es<=10;
	lcd(11 downto 0)<="100001010101";	--u
	
	
	when 10=>
	es<=11;
	lcd(11 downto 0)<="111001010101";	

	when 11=>
	es<=12;
	lcd(11 downto 0)<="100001010100";	--t
	
	
	when 12=>
	es<=13;
	lcd(11 downto 0)<="111001010100";	

	when 13=>
	es<=14;
	lcd(11 downto 0)<="100001001111";	--u
	
	
	when 14=>
	es<=15;
	lcd(11 downto 0)<="111001001111";	

	when 15=>
	es<=15;
			
	end case;
	end process;
	end architecture beh;