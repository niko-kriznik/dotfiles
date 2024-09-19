#
# CUSTOM (copy at the end of your .bashrc file)
#

# Aliases
alias vim='nvim'
alias start='nautilus --browser' # Linux (GNOME)
# alias start='open' # MacOS
alias gitsub='git submodule update --init --recursive'
alias gitreb='git rebase --continue'

# PS1 + Git
# Inspired by: https://gist.github.com/justintv/168835?permalink_comment_id=3643177#gistcomment-3643177
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="\e[1;32m\u\e[0;97m:\e[1;34m\]\w\e[3;33m\]\$(parse_git_branch)\e[00m\]\n$ "

# MacOS .zshrc
# setopt PROMPT_SUBST
# export PROMPT="%n: %~$(parse_git_branch)"$'\n'"$ "
