all: tb_alu74381.vcd
tb_alu74381.vcd: alu74381.o tb_alu74381.o
	ghdl -e tb_alu74381
	./tb_alu74381 --stop-time=200ns --vcd=tb_alu74381.vcd
	gtkwave tb_alu74381.vcd ondas.sav
alu74381.o: alu74381.vhdl
	ghdl -a alu74381.vhdl
tb_alu74381.o: tb_alu74381.vhdl
	ghdl -a tb_alu74381.vhdl
clean:
	rm *.o tb_alu74381 *.vcd *.cf