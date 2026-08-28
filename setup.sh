#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d%H%M%S)"
DRY_RUN=false

if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
fi

is_codespaces() {
  [[ "${CODESPACES:-}" == "true" || -n "${CODESPACE_NAME:-}" ]]
}

run() {
  if [[ "$DRY_RUN" == "true" ]]; then
    echo "[dry-run] $*"
    return 0
  fi
  "$@"
}

ensure_parent_dir() {
  local target="$1"
  run mkdir -p "$(dirname "$target")"
}

backup_if_needed() {
  local target="$1"
  local source="$2"

  if [[ -L "$target" ]] && [[ "$(readlink "$target")" == "$source" ]]; then
    return 0
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    run mkdir -p "$BACKUP_DIR"
    run mv "$target" "$BACKUP_DIR/"
  fi
}

link_item() {
  local source_rel="$1"
  local target="$2"
  local source="$DOTFILES_DIR/$source_rel"

  if [[ ! -e "$source" ]]; then
    echo "Skipping missing source: $source_rel"
    return 0
  fi

  ensure_parent_dir "$target"
  backup_if_needed "$target" "$source"
  run ln -s "$source" "$target"
  echo "Linked $target -> $source"
}

common_items=(
  ".bash_profile:$HOME/.bash_profile"
  ".bashrc:$HOME/.bashrc"
  ".dircolors:$HOME/.dircolors"
  ".gitconfig:$HOME/.gitconfig"
  ".ideavimrc:$HOME/.ideavimrc"
  ".zshenv:$HOME/.zshenv"
  ".zshrc:$HOME/.zshrc"
  "nvim:$HOME/.config/nvim"
  "ranger:$HOME/.config/ranger"
)

non_codespaces_items=(
  "alacritty:$HOME/.config/alacritty"
  "wezterm:$HOME/.config/wezterm"
  "keybindings_mac.zsh:$HOME/.config/keybindings_mac.zsh"
  "wezterm_keybindings.lua:$HOME/.config/wezterm/wezterm_keybindings.lua"
)

for item in "${common_items[@]}"; do
  source_rel="${item%%:*}"
  target="${item#*:}"
  link_item "$source_rel" "$target"
done

if ! is_codespaces; then
  for item in "${non_codespaces_items[@]}"; do
    source_rel="${item%%:*}"
    target="${item#*:}"
    link_item "$source_rel" "$target"
  done
fi

echo "Done."
if [[ -d "$BACKUP_DIR" ]]; then
  echo "Backups stored in: $BACKUP_DIR"
fi
