#/bin/bash

. .bashrc.d/00_commands.sh
. .bashrc.d/10_colors.sh
. .bashrc.d/11_log.sh

# Set logging level
LOG_LEVEL=$VERBOSE

# Uncommnet this line to test this in the /tmp/ directory
# TESTING=1
timestamp=$(date --iso-8601=seconds)

# Set parameters differently if we're testing the install script.
if [[ -z "${TESTING}" ]]; then
  BASHRC_FILE="${HOME}/.bashrc"
  BACKUP_BASHRC="${HOME}/.bashrc_backup_${timestamp}"
else
  BASHRC_FILE="/tmp/.bashrc"
  BACKUP_BASHRC="/tmp/.bashrc_backup_${timestamp}"
  rm ${BASHRC_FILE}
  touch ${BASHRC_FILE}
fi


BASHSETUP_CMD=$(eval "echo source $(pwd)/BashSetup.sh")
BASHSETUP_HOME=$(pwd)


function test_log() {
  [ ! -z ${TESTING:+0} ] && printf "${Yellow}[TESTING] - ${*}${ResetColor}\n"
}


function create_bachrc_backup() {
  cp ${BASHRC_FILE} ${BACKUP_BASHRC}
  test_log "Created backup: ${BACKUP_BASHRC}"
  test_log "contents: $(cat ${BACKUP_BASHRC})"
}


function add_hook_to_bashrc() {
  local check_for_hook=$(cat ${BASHRC_FILE} | grep "$BASHSETUP_CMD")
  if [[ -z "${check_for_hook}" ]] || ! [[ -z ${TESTING:+0} ]]; then
    echo "" >> ${BASHRC_FILE}
    echo "# =====================================================================" >> ${BASHRC_FILE}
    echo "# BashSetup https://github.com/jsaylor525/BashSetup.git" >> ${BASHRC_FILE}
    echo "export BASHSETUP_HOME=${BASHSETUP_HOME}" >> ${BASHRC_FILE}
    echo "${BASHSETUP_CMD}" >> ${BASHRC_FILE}
    echo "" >> ${BASHRC_FILE}
  fi
}


# Force this to be run in the Repo's directory
if [ -f $(pwd)/install.sh ]; then
  cleanup.sh
  create_bachrc_backup
  add_hook_to_bashrc
else
  echo "change directory to the BashSetup repo and rerun"
fi

# log_v "Contents of the .bashrc file\n$(cat ${BASHRC_FILE})"

# Immedieately load the bashrc
# source ${BASHRC_FILE}

unset TESTING
