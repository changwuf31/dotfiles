if status --is-interactive;
	# Aliases
	alias vim='nvim'
	alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

	# Fish Variables
	set SPACEFISH_PROMPT_ORDER time user dir host git package node golang php docker aws kubecontext exec_time line_sep vi_mode jobs exit_code char

	# Global Variables
	set -gx PATH ~/.fzf/bin ~/bin $PATH
end
