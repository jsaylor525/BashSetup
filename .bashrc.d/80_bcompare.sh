#!/bin/bash

# Uncomment this line to force the bcompare
# BCOMPARE_ENABLED=1

if ! [[ -z ${BCOMPARE_ENABLED} ]]; then 
  if ! [[ -r /usr/bin/bcompare ]]; then
    # If it's not installed print some easy install instructions
    log_f "Beyond Compare is not installed yet.\n"
    printf "curl http://scootersoftware.com/bcompare-4.3.3.24545_amd64.deb > /tmp/bcompare.deb\n"
    printf "sudo dpkg -i /tmp/bcompare.deb\n"
    printf "sudo apt-get install -f\n\n"
  else
    # Set Beyond Compare as the default diff tool
    git config --global diff.tool bc
    git config --global difftool.prompt false
    git config --global difftool.bc trustExitCode true
    git config --global difftool.bc.path "/usr/bin/bcompare"
    # Set Beyond Compare as the default merge tool
    git config --global merge.tool bc
    git config --global mergetool.bc trustExitCode true
    git config --global mergetool.bc.path "/usr/bin/bcompare"

    log_s "Beyond Compare configured as git default"
  fi
fi
