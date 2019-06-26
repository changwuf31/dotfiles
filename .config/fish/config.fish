set -gx HOSTNAME (hostname)

if status --is-interactive;
	[ -e $HOME/.config/fish/shared.fish ]; and source $HOME/.config/fish/shared.fish
	[ -e $HOME/.config/fish/$HOSTNAME.fish ]; and source $HOME/.config/fish/$HOSTNAME.fish
end
