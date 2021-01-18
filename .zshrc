zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit
autoload -Uz select-word-style
select-word-style bash
setopt interactivecomments
set show-all-if-ambiguous on
set completion-ignore-case on
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
export PROMPT='%m:%B%70<..<%~%b %(!.#.>) '

# aliases
alias l='ls -lGhF'
alias cp='cp -i'
alias mv='mv -i'
alias python="python3"
alias realpath="python -c 'import os,sys;print(os.path.realpath(sys.argv[1]))'"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# obsolete mac tweaks
#bindkey "\033[5C" forward-word
#bindkey "\033[5D" backward-word
#bindkey "^[[3~" delete-char
