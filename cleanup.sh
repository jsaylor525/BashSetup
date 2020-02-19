#!/bin/bash
#####################################################################
# The script is intended to cleanup old versions of BashSetup
#####################################################################


# Include files needed
. .bashrc.d/00_commands.sh > /dev/null
. .bashrc.d/11_log.sh > /dev/null


snippettoken="# Automatic Snippet from BashSetup"

function remove_snippet() {
    # Using linenumber remove the snippet from ~/.bashrc
    #
    # Finds the token `# Automatic Snippet from BashSetup` linenumber
    # creates offsets from there and removes the snippet
    echo "Removing snippet from ~/.bashrc"
    cat << SNIPPET
#####################################################################
# Automatic Snippet from BashSetup
if [ -d ${HOME}/.bashrc.d ]; then
for i in ${HOME}/.bashrc.d/*.sh; do
    if [ -r $i ]; then
    . $i
    fi
done
unset i
fi
SNIPPET
    # Get the linenumber where the snippet's token is
    local linenumber=$(grep -n "# Automatic Snippet from BashSetup" ~/.bashrc)
    # Clean up grep output by removing everything after ':' 
    # ex. 129:# Automatic Snippet from BashSetup
    local linenumber=${linenumber%%:*}
    # Create offsets from token to encompass entire snippet
    local start=$((${linenumber}-1))
    local stop=$((${linenumber}+9))
    # Using sed do a inplace (-i) remove of the lines in range start and stop
    sed -i -e "${start},${stop}d" ~/.bashrc
}


# Interactive removal of ~/.bashrc.d
# 
# Will print out the diff and the warning before prompting for choice on removal
# of each script in ~/.bashrc.d
function remove_bashrcd() {
    for i in ~/.bashrc.d/*.sh; do
        local fname=$(filename $i)
        local delta=$(diff $i .bashrc.d/$fname)
        if [[ ! -z "${delta}" ]]; then
            local r=".bashrc.d/$fname"
            diff $i .bashrc.d/$fname
            log_w "There was a diff between $i and $r see above for diff"
            rm -i $i
        fi
    done
    unset i
}

if [[ ! -z $(grep "$snippettoken" ~/.bashrc) ]]; then
    remove_snippet
fi
unset snippettoken

if [[ -d ~/.bashrc.d ]]; then
    remove_bashrcd
fi
