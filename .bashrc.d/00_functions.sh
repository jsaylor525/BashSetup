#!/bin/bash

# Standard Colors
export PRINT_BLACK='\033[0;30m'
export PRINT_RED='\033[0;31m'
export PRINT_GREEN='\033[0;32m'
export PRINT_ORANGE='\033[0;33m'
export PRINT_BLUE='\033[0;34m'
export PRINT_YELLOW='\033[1;33m'
export PRINT_PURPLE='\033[0;35m'
export PRINT_CYAN='\033[0;36m'
export PRINT_WHITE='\033[1;37m'
export PRINT_DEFAULT='\033[0m'

# More colors
export PRINT_DARK_GRAY='1;30'
export PRINT_LIGHT_RED='1;31'
export PRINT_LIGHT_GREEN='1;32'
export PRINT_LIGHT_BLUE='1;34'
export PRINT_LIGHT_PURPLE='1;35'
export PRINT_LIGHT_CYAN='1;36'
export PRINT_LIGHT_GRAY='0;37'     

echo_success() {
  printf "${PRINT_GREEN}[SUCCESS]${PRINT_DEFAULT} - ${1}\n"
}
export -f echo_success
alias echo_s="echo_success"

echo_debug() {
  printf "${PRINT_PURPLE}[SUCCESS]${PRINT_DEFAULT} - ${1}\n"
}
alias echo_s="echo_debug"

echo_failure() {
  printf "${PRINT_RED}[FAILURE]${PRINT_DEFAULT} - ${1}\n"
}
export -f echo_failure
alias echo_f="echo_failure"
alias echo_fail="echo_failure"
alias echo_error="echo_failure"
alias echo_e="echo_failure"

echo_warning() {
  printf "${PRINT_YELLOW}[WARNING]${PRINT_DEFAULT} - ${1}\n"
}
export -f echo_warning
alias echo_w="echo_warning"
alias echo_warning="echo_warning"
``
echo_success "Loaded Functions"
