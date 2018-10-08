# Current directory (with ~ as home)
PR_CWD="%~"
# "(N) " where N = number of running jobs (if N > 0)
PR_JOBS="%1(j.(%j) .)"
# Exit status of last command (if nonzero)
PR_EXIT="%0(?..%F{red}[%?]%f)"

source ~/.dotfiles/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=verbose
GIT_PS1_SHOWUNTRACKEDFILES=true

# Perform expansion in prompt
setopt promptsubst

export PROMPT='$PR_CWD $(__git_ps1 "(%s) ")%B$%b $PR_JOBS'
export RPROMPT='$PR_EXIT'

# Prevent autocompleting home directories
# See: https://unix.stackexchange.com/questions/45518/oh-my-zsh-completion-on-home-directory-names
unsetopt cdable_vars

# History file
HISTFILE=~/.zhistory
# Number of lines to read from history file
HISTSIZE=4096
# Number of lines to save to history file
SAVEHIST=4096
# Share history across all sessions immediately
setopt inc_append_history

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.6/bin:$PATH"

#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"
#
export PATH=/Library/TeX/texbin:$PATH
export MANPATH=/Library/TeX/Distributions/.DefaultTeX/Contents/Man:$MANPATH
