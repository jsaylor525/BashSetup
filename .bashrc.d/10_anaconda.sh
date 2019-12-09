#!/bin/bash

export ANACONDA_HOME="${HOME}/anaconda3"

. ${ANACONDA_HOME}/etc/profile.d/conda.sh

conda activate

[ ! -z "$DISPLAY" ] && echo_success "Custom python configuration loaded."