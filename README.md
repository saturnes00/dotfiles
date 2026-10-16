# dotfiles

Ma config macOS (Apple Silicon) : terminal, éditeurs et outils, habillés aux couleurs de **Saturnes Vapor**, une palette vaporwave nuit indigo + bleu / rose / violet.

## Contenu

| Dossier | Ce que c'est |
|---|---|
| `zsh/` | `.zshrc` : Oh My Zsh, fzf, zoxide, mise, coloration syntaxique |
| `vim/` | `.vimrc` + thème `saturnes_vapor.vim` |
| `ghostty/` | config du terminal [Ghostty](https://ghostty.org) + thème `saturnes-vapor` |
| `btop/` | moniteur système, utilise les couleurs du terminal |
| `sublime/` | thème `Saturnes Vapor` pour Sublime Text + préférences |
| `Brewfile` | tous les outils installés avec Homebrew |

## Installation

```bash
git clone https://github.com/saturnes00/dotfiles.git ~/Desktop/Code/dotfiles
cd ~/Desktop/Code/dotfiles
bash install.sh            # liens + outils Homebrew
bash install.sh --no-brew  # liens seulement
```

Le script crée des liens symboliques vers les fichiers du repo. Ce qui existait déjà est sauvegardé dans `~/.dotfiles-backup/<date>/`, rien n'est écrasé.

Oh My Zsh est à installer à part : <https://ohmyz.sh>.

## Palette Saturnes Vapor

| Rôle | Couleur |
|---|---|
| Fond | `#0c0818` |
| Texte | `#ece4ff` |
| Fonctions, curseur | `#2ee6ff` cyan |
| Types | `#4d7cff` bleu |
| Mots-clés | `#9d5cff` violet |
| Nombres, constantes | `#e070ff` orchidée |
| Chaînes | `#ff3db1` rose |
| `#include`, `#define` | `#ff3d9a` rose vif |
| Opérateurs | `#8f8fd8` lilas |
| Commentaires | `#5d4f8a` |

## Mettre à jour

Comme les configs sont des liens vers ce dossier, il suffit de les modifier normalement puis :

```bash
brew bundle dump --force   # si de nouveaux outils ont été installés
git add -A && git commit -m "…" && git push
```
