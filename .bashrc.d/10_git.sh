#!/bin/bash

function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)/`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host:$__cur_location$__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

# git config --global push.default simple
git config --global push.default tracking

# Git Editors
if [ ! -z "$DISPLAY" ]; then
    git config --global diff.tool "code --wait --diff"
    git config --global merge.tool "code --wait --diff"
    git config --global core.editor "code --wait"
else
    git config --global diff.tool "nano"
    git config --global merge.tool "nano"
    git config --global core.tool "nano"
fi

## Git Aliases
git config --global alias.unstage 'reset HEAD --'

# Show a shorten log in form:
# * [hash #######] - (*branch/tag) [commit msg subject] ([X time ago]) <[author]>
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# git branch
git config --global alias.br branch

# log upstream (logu)
git config --global alias.logu "log -p @{u}.."

# graph branch (gb) - to show a graph starting from a given commit
git config --global alias.gb "log --graph --boundary --date-order --pretty=tformat:'%C(yellow)%h%Creset %C(magenta)%aE %ai%Creset %C(green bold)%d%Creset%n %s'"

# graph (g) - show a graph of all commits
git config --global alias.g "!git gb --all"

# graph outgoing (go) - see a graph of all commits that would be added to the upstream
git config --global alias.go "!git gb @{u}.."

# graph incoming (gi) - see a graph of all commits that are in the upstream branch but not in the local branch
git config --global alias.gi "!git remote update -p; git gb ..@{u}"

# See all commits that have not yet been pushed. 
git config --global alias.unpushed "!git g --not --remotes --tags"


if [ -r /snap/bin/gitkraken ]; then 
    git config --global alias.kraken '!/snap/bin/gitkraken[] &> /dev/null &'
    alias git-kraken="gitkraken &> /dev/null &"
    alias GitKraken="gitkraken &> /dev/null &"
fi

[ ! -z "$DISPLAY" ] && echo_success "Custom git configuration loaded."