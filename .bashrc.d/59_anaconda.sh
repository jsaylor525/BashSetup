#!/bin/bash

# Default path for anaconda
export ANACONDA_HOME=${ANACONDA_HOME:-"${HOME}/anaconda3"}

# Enable Anaconda if USE_ANACONDA is set and ANACONDA_HOME is valid
if [ -d $ANACONDA_HOME ] && [ ! -z "${USE_ANACONDA}" ]; then
  . ${ANACONDA_HOME}/etc/profile.d/conda.sh

  conda activate
  alias anaconda-navigator="${HOME}/anaconda3/bin/anaconda-navigator &> /dev/null &"
  alias conda-navigator="${HOME}/anaconda3/bin/anaconda-navigator &> /dev/null &"
  alias conda-envs="conda env list"

  [ ! -z "$DISPLAY" ] && log_success "Enabled python Anaconda configuration loaded."
else
  [ ! -z "$DISPLAY" ] && log_warning "Bypassing Anaconda setup."
fi
