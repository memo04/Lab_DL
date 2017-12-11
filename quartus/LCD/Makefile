all:tb_LCD
	
tb_LCD: LCD.o tb_LCD.o
	ghdl -e --ieee=synopsys tb_lcd
	./tb_lcd --stop-time=450ns --vcd=tb_LCD.vcd
	gtkwave tb_LCD.vcd ondas.gtkw

LCD.o:LCD.vhdl
	ghdl -a LCD.vhdl

tb_LCD.o:tb_LCD.vhdl
	ghdl -a tb_LCD.vhdl

clean:
	rm *.o tb_ lcd*.vcd *.cf
