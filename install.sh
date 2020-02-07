#/bin/bash

. .bashrc.d/00_commands.sh
. .bashrc.d/10_colors.sh
. .bashrc.d/11_log.sh

# Set logging level
# LOG_LEVEL=$VERBOSE

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
  [ ! -z ${TESTING:+0} ] && printf "${Yellow}[TESTING] - ${*}${ResetColor}\n"
}


function create_bachrc_backup() {
  mkdir -p ${BACKUP_DIR}
  cp -r ${BASHRC_DIR} ${BACKUP_DIR}
  cp ${BASHRC_FILE} ${BACKUP_DIR}
  test_log "Created backup: ${BACKUP_DIR}"
  test_log "contents: $(ls -al ${BACKUP_DIR})"
}


function add_hook_to_bashrc() {
  local check_for_hook=$(cat ${BASHRC_FILE} | grep .bashrc.d)
  if [[ -z "${check_for_hook}" ]]; then
    cat bashrd_snippet >> ${BASHRC_FILE}
  fi
}


function copy_scripts_to_bashrcd() {
  if [[ -d ".bashrc.d" ]]; then
    for i in .bashrc.d/*.sh; do
      local scriptname=${i##*/}
      cp $i ${BASHRC_DIR}/${scriptname}
      log_i "Installed $scriptname"
    done
    unset i
  else
    echo "Couldn't find .bashrc directory, make sure you run this from the local directory."
  fi
}


function show_deltas() {
  log_w "$(diff .bashrc.d ${BASHRC_DIR})"
}

create_bachrc_backup
add_hook_to_bashrc
copy_scripts_to_bashrcd
show_deltas

# log_v "Contents of the .bashrc file\n$(cat ${BASHRC_FILE})"
# log_d "Contents of the .bashrc.d directory\n$(ls -al ${BASHRC_DIR})"

# Immedieately load the bashrc
# source ${BASHRC_FILE}

unset TESTING
