#!/bin/bash

export VERBOSE=5
export DEBUG=4
export INFO=3
export WARNING=2
export ERROR=1
export LOG_LEVEL=${LOG_LEVEL:-3}


set_log_level() {
  export LOG_LEVEL=$1
}


log_success() {
  printf "${Green}[SUCCESS] - ${*}${ResetColor}\n"
}
export -f log_success
alias log_s="log_success"


log_failure() {
  printf "${Red}[FAILURE] - ${*}${ResetColor}\n"
}
export -f log_failure
alias log_f="log_failure"
alias log_fail="log_failure"


log_verbose() {
  [ ${LOG_LEVEL} -ge ${VERBOSE} ] && printf "${Green}[VERBOSE] - ${*}${ResetColor}\n"
}
export -f log_verbose
alias log_v="log_verbose"


log_debug() {
  [ ${LOG_LEVEL} -ge ${DEBUG} ] && printf "${Magenta}[DEBUG] - ${*}${ResetColor}\n"
}
export -f log_debug
alias log_d="log_debug"


log_info() {
  [ ${LOG_LEVEL} -ge ${INFO} ] && printf "${Blue}[INFO] - ${*}${ResetColor}\n"
}
export -f log_info
alias log_i="log_info"


log_warning() {
  [ ${LOG_LEVEL} -ge ${WARNING} ] && printf "${Yellow}[WARNING] - ${*}${ResetColor}\n"
}
export -f log_warning
alias log_w="log_warning"
alias log_warn="log_warning"


log_error() {
  [ ${LOG_LEVEL} -ge ${ERROR} ] && printf "${Red}[FAILURE] - ${*}${ResetColor}\n"
}
export -f log_error
alias log_err="log_error"
alias log_e="log_error"


[ ! -z "$DISPLAY" ] && log_success "Loaded Logging (Level=${LOG_LEVEL})"
