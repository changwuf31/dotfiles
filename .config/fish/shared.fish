# Fish Variables
set SPACEFISH_PROMPT_ORDER time user dir host git package node golang php docker aws kubecontext exec_time line_sep vi_mode jobs exit_code char

# Global Variables
set -gx PATH ~/.fzf/bin ~/bin $PATH
set -gx YEAR (date +%Y)
set -gx EDITOR vim

# Aliases
#alias vim='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias i='cd ~/archive/$YEAR/draft; vim inbox-zero.md'
alias j='cd ~/archive/$YEAR/draft; vim journal.md'
alias p='cd ~/archive/$YEAR/draft; vim policy.md'
alias t='todo.sh'

function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# enables $?
function bind_status
  commandline -i (echo '$status')
end

# enables $$
function bind_self
  commandline -i (echo '%self')
end

# enable keybindings
function fish_user_key_bindings
  bind ! bind_bang
  bind '$' bind_dollar
  bind '$?' bind_status
  bind '$$' bind_self
end
