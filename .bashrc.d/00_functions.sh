#!/bin/bash

log_success() {
  printf "${Green}[SUCCESS] - ${*}${ResetColor}\n"
}
export -f log_success
alias log_s="log_success"


log_verbose() {
  printf "${Green}[VERBOSE] - ${*}${ResetColor}\n"
}
export -f log_verbose
alias log_v="log_verbose"


log_debug() {
  printf "${Magenta}[DEBUG] - ${*}${ResetColor}\n"
}
export -f log_debug
alias log_d="log_debug"


log_info() {
  printf "${Blue}[INFO] - ${*}${ResetColor}\n"
}
export -f log_info
alias log_i="log_info"


log_failure() {
  printf "${Red}[FAILURE] - ${*}${ResetColor}\n"
}
export -f log_failure
alias log_f="log_failure"
alias log_fail="log_failure"
alias log_error="log_failure"
alias log_err="log_failure"
alias log_e="log_failure"


log_warning() {
  printf "${Yellow}[WARNING] - ${*}${ResetColor}\n"
}
export -f log_warning
alias log_w="log_warning"
alias log_warn="log_warning"
alias log_warning="log_warning"

[ ! -z "$DISPLAY" ] && log_success "Loaded Functions"
