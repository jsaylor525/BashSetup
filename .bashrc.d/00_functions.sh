#!/bin/bash   

echo_success() {
  printf "${Green}[SUCCESS]${ResetColor} - ${1}\n"
}
export -f echo_success
alias echo_s="echo_success"


echo_debug() {
  printf "${Magenta}[DEBUG]${ResetColor} - ${1}\n"
}
alias echo_s="echo_debug"


echo_failure() {
  printf "${Red}[FAILURE]${ResetColor} - ${1}\n"
}
export -f echo_failure
alias echo_f="echo_failure"
alias echo_fail="echo_failure"
alias echo_error="echo_failure"
alias echo_err="echo_failure"
alias echo_e="echo_failure"


echo_warning() {
  printf "${Yellow}[WARNING]${ResetColor} - ${1}\n"
}
export -f echo_warning
alias echo_w="echo_warning"
alias echo_warn="echo_warning"
alias echo_warning="echo_warning"

[ ! -z "$DISPLAY" ] && echo_success "Loaded Functions"
