## This makefile copied from PSAS/Oresat firmware-solar project, 
## and slightly modified - TMH
##----------------------------------------------------------------------

APP_HEXFILE = $(BUILDDIR)/$(PROJECT).hex
GDB_ELF = $(BUILDDIR)/$(PROJECT).elf
OOCD_CFG = ./para-programar/oocd.cfg
GDB_OOCD_CFG = gdboocd.cmd
GDB_STL_CFG = gdbstl.cmd
SERIAL_RAW != echo -e "$(SERIAL)"

# NOTE:  following two rules already borrowed and used in Ted's file
#   named 'write-options.mk':

## write: $(APP_HEXFILE) write_ocd

## write_ocd:
## #	openocd -s $(BOARDDIR) -f $(OOCD_CFG) -c "hla_serial $(SERIAL); program $(APP_HEXFILE) verify reset exit"
## 	openocd -s $(BOARDDIR) -f $(OOCD_CFG) -d3 -c "hla_serial $(SERIAL); program $(APP_HEXFILE) verify reset exit"

write_stl:
	st-flash --serial=$(SERIAL_RAW) --reset --format ihex write $(APP_HEXFILE)

gdb: $(GDB_ELF) gdb_ocd

gdb_ocd:
	$(TRGT)gdb -q $(shell pwd)/$(GDB_ELF) -cd $(BOARDDIR) -ex "target remote | openocd -f oocd.cfg -c 'hla_serial $(SERIAL); gdb_port pipe'" -x $(GDB_OOCD_CFG)

gdb_stl:
	$(TRGT)gdb -q $(shell pwd)/$(GDB_ELF) -cd $(TOOLCHAIN) -x ./$(GDB_STL_CFG)

serial:
	picocom -b 115200 /dev/serial/by-id/usb-STMicroelectronics_STLINK-V3_$(SERIAL_RAW)-if02
