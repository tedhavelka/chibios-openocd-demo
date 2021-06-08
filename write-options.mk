##
## 2021-04-15 THU -
## Makefile lines here copied from Oresat toolchain/toolchain.mk:
##----------------------------------------------------------------------

#  Need to account for $(BOARDDIR), will follow pattern in Oresat card
#  firmware projects . . .
#
#  Ah we also need provide PROJ_ROOT and BOARD, those are not part of any
#  ChibiOS demo.
#
#  Need to provide $(SERIAL)

##SERIAL = STM32_STM32_STLink-0:0

BOARDDIR  = $(PROJ_ROOT)/boards/$(BOARD)



APP_HEXFILE = $(BUILDDIR)/$(PROJECT).hex
GDB_ELF = $(BUILDDIR)/$(PROJECT).elf
OOCD_CFG = oocd.cfg
GDB_OOCD_CFG = gdboocd.cmd
GDB_STL_CFG = gdbstl.cmd
SERIAL_RAW != echo -e "$(SERIAL)"

write: $(APP_HEXFILE) write_ocd


PROGRAMMER_SCRIPTS_DIR=./para-programar

write_ocd:
#	openocd -s $(BOARDDIR) -f $(OOCD_CFG) -c "hla_serial $(SERIAL); program $(APP_HEXFILE) verify reset exit"
#	openocd -f $(OOCD_CFG) -c "hla_serial $(SERIAL); program $(APP_HEXFILE) verify reset exit"
#	openocd -f /usr/local/share/openocd/scripts/interface/stlink.cfg -f /usr/local/share/openocd/scripts/board/stm32vldiscovery.cfg -d3 -c "hla_serial $(SERIAL); program $(APP_HEXFILE) verify reset exit"
#	openocd -f /usr/local/share/openocd/scripts/interface/stlink.cfg -f /usr/local/share/openocd/scripts/board/stm32vldiscovery.cfg -c "hla_serial $(SERIAL); program $(APP_HEXFILE) verify reset exit"

# 2021-04-19 - correcting openocd board configuration file choice:
#	openocd -f /usr/local/share/openocd/scripts/interface/stlink.cfg -f /usr/local/share/openocd/scripts/board/st_nucleo_f0.cfg -c "hla_serial $(SERIAL); program $(APP_HEXFILE) verify reset exit"

	openocd -f ${PROGRAMMER_SCRIPTS_DIR}/stlink.cfg -f ${PROGRAMMER_SCRIPTS_DIR}/st_nucleo_f0.cfg -c "hla_serial $(SERIAL); program $(APP_HEXFILE) verify reset exit"
