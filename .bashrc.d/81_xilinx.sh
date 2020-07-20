#!/bin/bash

if [[ ! -z "${USE_XILINX}" ]]; then
   export XILINXD_LICENSE_FILE=27100@kenmore
   export LM_LICENSE_FILE=27100@kenmore
   export SWT_GTK3=0

   # VIVADO_VERSION=${VIVADO_VERSION:-"2014.3"}
   # VIVADO_VERSION=${VIVADO_VERSION:-"2015.2"}
   # VIVADO_VERSION=${VIVADO_VERSION:-"2016.2"}
   # VIVADO_VERSION=${VIVADO_VERSION:-"2016.4"}
   VIVADO_VERSION=${VIVADO_VERSION:-"2019.2"}
   export VIVADO_VERSION
   case ${VIVADO_VERSION} in
      201[4-8]* )
         # Xilinx Vivado
         alias xil="source /opt/Xilinx/Vivado/${VIVADO_VERSION}/settings64.sh && echo \"Xilinx Vivado settings loaded: ${XILINX_VIVADO}\""
         # Xilinx SDK
         alias xilsw="source /opt/Xilinx/SDK/${VIVADO_VERSION}/settings64.sh && echo \"Xilinx SW settings loaded: ${XILINX_VIVADO}\""
         # PetaLinux
         alias peta="source /opt/Xilinx/petalinux/${VIVADO_VERSION}/settings.sh"
         ;;
      2019.2 )
         # Xilinx Vivado
         alias xil="source /tools/Xilinx/Vivado/${VIVADO_VERSION}/settings64.sh && echo \"Xilinx Vivado settings loaded: ${VIVADO_VERSION}\""
         # Xilinx SDK
         alias xilsw="source /tools/Xilinx/SDK/${VIVADO_VERSION}/settings64.sh && echo \"Xilinx SW settings loaded: ${VIVADO_VERSION}\""
         # PetaLinux
         alias peta="source /tools/Xilinx/petalinux/${VIVADO_VERSION}/settings.sh"
         ;;
   esac

   alias px='xil && peta'

   [ ! -z "$DISPLAY" ] && log_success "Custom Xilinx configuration loaded."
fi
