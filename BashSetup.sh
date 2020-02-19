#!/bin/bash
#####################################################################
# The script should be sourced from your ~/.bashrc
# 
# For best results it is recommended to use the repo instead of
# copying files into the a directory.
# 
# In previous versions of this software this script was treated at
# a snippet and appended to a users ~/.bashrc and the .bashrc.d
# directory was copied to the HOME directory. This updates had to be
# re-installed. This newer version allows updates to be inplace after
# a simple git pull.
#####################################################################


# Loop through all files in the .d directory
if [ -d ${BASHSETUP_HOME}/.bashrc.d ]; then
  for i in ${BASHSETUP_HOME}/.bashrc.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
