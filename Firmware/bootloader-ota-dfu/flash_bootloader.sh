#!/bin/bash

######################################
# MERGING SOFTDEVICE AND BOOTLOADER
#####################################
echo "Merging bootloader and softdevice hex files..."
echo -e "#####################################"
mergehex -m hex/s132_nrf52_2.0.0_softdevice.hex hex/dfu_dual_bank_ble_s132_pca10040.hex -o merged.hex
echo -e "\n\n"

######################################
# CHIP ERASE SECTION
#####################################
echo "Erasing nfr52 board..."
echo -e "######################################"
nrfjprog -e -f nrf52
echo -e "\n\n"


######################################
# CHIP BOOTLOADER FLASH SECTION
#####################################
echo "Programming the nrf52 board..."
echo -e "######################################"
nrfjprog -r --program merged.hex -f nrf52
echo -e "\n\n"

