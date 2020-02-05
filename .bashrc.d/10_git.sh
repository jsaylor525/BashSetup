#!/bin/bash
if [ ! -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    echo "You need to install the bash-git-prompt!"
    echo "Use the following command to get bash-git-prompt"
    echo ""
    echo "git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1"
    echo ""
else
    GIT_PROMPT_ONLY_IN_REPO=1
    # GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
    # GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules
    # GIT_PROMPT_WITH_VIRTUAL_ENV=0 # uncomment to avoid setting virtual environment infos for node/python/conda environments

    # GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
    # GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files

    # GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

    # GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

    # GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
    # GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

    # as last entry source the gitprompt script
    # GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
    # GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
    # GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

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