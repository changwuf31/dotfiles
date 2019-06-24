if status --is-interactive;
	alias vim='nvim'
	alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

	set -gx PATH ~/.fzf/bin ~/bin $PATH
end
