#!/usr/bin/env bash
# ─────────────────────────────────────────────
#  dotfiles — installation
#  Crée des liens symboliques de ce dossier vers les emplacements de config.
#  Les fichiers déjà présents sont sauvegardés dans ~/.dotfiles-backup/<date>/
#
#  Usage : ./install.sh            (liens + outils Homebrew)
#          ./install.sh --no-brew  (liens seulement)
# ─────────────────────────────────────────────
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y-%m-%d_%H%M%S)"
APP_SUPPORT="$HOME/Library/Application Support"

# link <fichier du repo> <emplacement de destination>
link() {
	local src="$DOTFILES/$1"
	local dst="$2"

	mkdir -p "$(dirname "$dst")"

	# Déjà le bon lien → rien à faire
	if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
		echo "  ok      $dst"
		return
	fi

	# Un fichier existe déjà → on le sauvegarde
	if [ -e "$dst" ] || [ -L "$dst" ]; then
		mkdir -p "$BACKUP"
		mv "$dst" "$BACKUP/"
		echo "  backup  $dst"
	fi

	ln -s "$src" "$dst"
	echo "  lien    $dst"
}

echo "→ Liens de config"
link zsh/.zshrc                              "$HOME/.zshrc"
link vim/.vimrc                              "$HOME/.vimrc"
link vim/colors/saturnes_vapor.vim           "$HOME/.vim/colors/saturnes_vapor.vim"
link ghostty/config.ghostty                  "$APP_SUPPORT/com.mitchellh.ghostty/config.ghostty"
link ghostty/themes/saturnes-vapor           "$HOME/.config/ghostty/themes/saturnes-vapor"
link btop/btop.conf                          "$HOME/.config/btop/btop.conf"
link "sublime/Saturnes Vapor.sublime-color-scheme" "$APP_SUPPORT/Sublime Text/Packages/User/Saturnes Vapor.sublime-color-scheme"
link sublime/Preferences.sublime-settings    "$APP_SUPPORT/Sublime Text/Packages/User/Preferences.sublime-settings"

if [ "${1:-}" != "--no-brew" ]; then
	echo "→ Outils Homebrew (Brewfile)"
	if ! command -v brew >/dev/null 2>&1; then
		echo "  Homebrew n'est pas installé : https://brew.sh puis relance ce script."
		exit 1
	fi
	brew bundle --file="$DOTFILES/Brewfile"
fi

if [ -d "$BACKUP" ]; then
	echo "→ Anciens fichiers sauvegardés dans $BACKUP"
fi
echo "✓ Terminé. Ouvre un nouvel onglet de terminal pour charger la config."
