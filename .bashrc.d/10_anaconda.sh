#!/bin/bash

export ANACONDA_HOME="${HOME}/anaconda3"

if [ ! -d $ANACONDA_HOME ]; then
  . ${ANACONDA_HOME}/etc/profile.d/conda.sh

  conda activate

  [ ! -z "$DISPLAY" ] && echo_success "Custom python configuration loaded."
fi