#!/bin/bash

if [[ ! -z "${USE_XILINX}" ]]; then
   # VIVADO_VERSION="2015.2"
   # VIVADO_VERSION="2014.3"
   # VVIADO_VERSION="2016.2"
   VIVADO_VERSION="2016.4"
   export VIVADO_VERSION
   alias xil="source /opt/Xilinx/Vivado/${VIVADO_VERSION}/settings64.sh && echo \"Xilinx settings loaded: ${XILINX_VIVADO}\""
   # Xilinx SDK
   alias xilsw="source /opt/Xilinx/SDK/${VIVADO_VERSION}/settings64.sh"
   # PetaLinux
   alias peta="source /opt/Xilinx/petalinux/${VIVADO_VERSION}/settings.sh"
   alias px='xil && peta'

   [ ! -z "$DISPLAY" ] && log_success "Custom Xilinx configuration loaded."
fi
