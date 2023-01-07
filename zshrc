# === Prompt ====
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=verbose
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWCOLORHINTS=true
# Current directory (with ~ as home)
PROMPT_CWD="%~"
# "(N) " where N = number of running jobs (if N > 0)
PROMPT_JOBS="%1(j.(%j) .)"
precmd () { __git_ps1 $PROMPT_CWD "%B$%b $PROMPT_JOBS" " (%s) "  }
# Exit status of last command (if nonzero)
export RPROMPT="%0(?..%F{red}[%?]%f)"

# === Aliases ===
alias cdr="cd ~/Projects/recipe/recbase"