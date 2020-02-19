#!/bin/bash


# =================== Git Prompt ===================
function git_prompt() {
    if [ ! -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
        echo "You need to install the bash-git-prompt!"
        echo "Use the following command to get bash-git-prompt"
        echo ""
        echo "git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1"
        echo ""
    else
        # GIT_PROMPT_ONLY_IN_REPO=1
        # GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
        # GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules
        # GIT_PROMPT_WITH_VIRTUAL_ENV=0 # uncomment to avoid setting virtual environment infos for node/python/conda environments

        # GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
        # GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files

        # GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

        # GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

        # GIT_PROMPT_START="\[${BrightGreen}\]\u@\h \[${BrightBlue}\]\w\[${ResetColor}\]"
        # GIT_PROMPT_END="$ "

        # as last entry source the gitprompt script
        # GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
        # GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
        GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
        source $HOME/.bash-git-prompt/gitprompt.sh
    fi
}
git_prompt

[ ! -z "$DISPLAY" ] && log_success "Git prompt loaded"
