#!/usr/bin/env zsh

set -e

echo "Starting install of .dotfiles..."
readonly base_dir="$HOME/.dotfiles"
readonly bootstrap_path="$base_dir/bootstrap.sh"
readonly bootstrap_source_path="\$HOME/.dotfiles/bootstrap.sh"

if grep "source \"$bootstrap_source_path\"" "$HOME/.zshrc" &>/dev/null; then
	echo "Already installed."
	exit 0
else
	echo "Backing up .zshrc"
	cp -v "$HOME/.zshrc" "$HOME/.zshrc.$(date '+%Y-%m-%d').bak"
	cat <<EOF >>"$HOME/.zshrc"


# .dotfiles
if [[ -f "$bootstrap_source_path" ]]; then
    source "$bootstrap_source_path"
fi
EOF

	source "$bootstrap_path"

	"$base_dir/util/init.sh"

	echo "Successfully installed .dotfiles!"
fi
