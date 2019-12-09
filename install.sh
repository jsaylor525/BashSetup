#/bin/bash

# Uncommnet this line to test this in the /tmp/ directory
# TESTING=1

# Set parameters differently if we're testing the install script.
if [[ -z "${TESTING}" ]]; then
  BASHRC_FILE="${HOME}/.bashrc"
  BASHRC_DIR="${HOME}/.bashrc.d"
  mkdir -p ${BASHRC_DIR}/
else
  BASHRC_FILE="/tmp/.bashrc"
  BASHRC_DIR="/tmp/.bashrc.d"
  mkdir -p ${BASHRC_DIR}/
fi

function test_log() {
  [ ! -z ${TESTING:+0} ] && echo "[TESTING] $*"
}

function add_hook_to_bashrc() {
  check_for_hook=$(cat ${BASHRC_FILE} | grep .bashrc.d)
  if [[ -z "${check_for_hook}" ]]; then
    cat bashrd_snippet >> ${BASHRC_FILE}
    unset cmd
  fi
}

function copy_scripts_to_bashrcd() {
  if [[ -d ".bashrc.d" ]]; then
    for i in .bashrc.d/*.sh; do
      scriptname=${i##*/}
      test_log $scriptname
      cp $i ${BASHRC_DIR}/${scriptname}
      unset scriptname
    done
    unset i
  else
    echo "Couldn't find .bashrc directory, make sure you run this from the local directory."
  fi
}

add_hook_to_bashrc

copy_scripts_to_bashrcd

if [[ ! -z "${TESTING}" ]]; then
  test_log "Contents of the .bashrc file"
  cat ${BASHRC_FILE}

  test_log "Contents of the .bashrc.d directory"
  ls ${BASHRC_DIR}
fi

unset TESTING
