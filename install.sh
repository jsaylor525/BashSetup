#/bin/bash

. .bashrc.d/00_colors.sh

# Uncommnet this line to test this in the /tmp/ directory
# TESTING=1
timestamp=$(date --iso-8601=seconds)

# Set parameters differently if we're testing the install script.
if [[ -z "${TESTING}" ]]; then
  BASHRC_FILE="${HOME}/.bashrc"
  BASHRC_DIR="${HOME}/.bashrc.d"
  BACKUP_DIR="${HOME}/.bashrc_backup_${timestamp}"
  mkdir -p ${BASHRC_DIR}/
else
  BASHRC_FILE="/tmp/.bashrc"
  BASHRC_DIR="/tmp/.bashrc.d"
  BACKUP_DIR="/tmp/.bashrc_backup_${timestamp}"
  mkdir -p ${BASHRC_DIR}/
fi

function test_log() {
  [ ! -z ${TESTING:+0} ] && printf "${Yellow}[TESTING] $*${ResetColor}\n"
}


function create_bachrc_backup() {
  mkdir -p ${BACKUP_DIR}
  cp -r ${BASHRC_DIR} ${BACKUP_DIR}
  cp ${BASHRC_FILE} ${BACKUP_DIR}
  test_log "Created backup: ${BACKUP_DIR}"
  test_log "contents: $(ls ${BACKUP_DIR})"
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

create_bachrc_backup
add_hook_to_bashrc
copy_scripts_to_bashrcd

if [[ ! -z "${TESTING}" ]]; then
  test_log "Contents of the .bashrc file"
  cat ${BASHRC_FILE}

  test_log "Contents of the .bashrc.d directory"
  ls ${BASHRC_DIR}
fi

unset TESTING
