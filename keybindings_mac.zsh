#!/usr/bin/env zsh
# =============================================================================
# ZSH Keybindings — macOS
# Compatible with: WezTerm + Starship
# =============================================================================
# Source this file from your ~/.zshrc:
#   source ~/.config/zsh/keybindings_mac.zsh
# =============================================================================

# Use emacs-style bindings as the base (consistent with macOS system behavior)
bindkey -e

# -----------------------------------------------------------------------------
# Cursor Movement
# -----------------------------------------------------------------------------
# macOS terminals send different escape sequences than Linux for modified arrows
bindkey '^[[1;5C' forward-word          # Ctrl+Right  → move forward one word
bindkey '^[[1;5D' backward-word         # Ctrl+Left   → move backward one word
bindkey '^[f'     forward-word          # Alt+Right   → move forward one word (macOS native)
bindkey '^[b'     backward-word         # Alt+Left    → move backward one word (macOS native)
bindkey '^[[H'    beginning-of-line     # Home        → go to beginning of line
bindkey '^[[F'    end-of-line           # End         → go to end of line
bindkey '^A'      beginning-of-line     # Ctrl+A      → go to beginning of line
bindkey '^E'      end-of-line           # Ctrl+E      → go to end of line

# macOS-specific: Option+Arrow (WezTerm can be configured to emit these)
bindkey '^[[1;3C' forward-word          # Option+Right (WezTerm sends \e[1;3C)
bindkey '^[[1;3D' backward-word         # Option+Left  (WezTerm sends \e[1;3D)

# -----------------------------------------------------------------------------
# Deletion
# -----------------------------------------------------------------------------
bindkey '^[[3~'   delete-char           # Delete      → delete character under cursor
bindkey '^H'      backward-delete-char  # Backspace   → delete character before cursor
bindkey '^W'      backward-kill-word    # Ctrl+W      → delete word before cursor
bindkey '^[^?'    backward-kill-word    # Alt+Backspace → delete word before (macOS)
bindkey '^[[3;3~' kill-word             # Alt+Delete  → delete word after cursor
bindkey '^U'      kill-whole-line       # Ctrl+U      → clear entire line
bindkey '^K'      kill-line             # Ctrl+K      → clear from cursor to end of line

# -----------------------------------------------------------------------------
# History Navigation
# -----------------------------------------------------------------------------
bindkey '^[[A'    up-line-or-history    # Up Arrow    → previous history item
bindkey '^[[B'    down-line-or-history  # Down Arrow  → next history item
bindkey '^R'      history-incremental-search-backward  # Ctrl+R → reverse history search
bindkey '^S'      history-incremental-search-forward   # Ctrl+S → forward history search

# Substring history search (requires zsh-history-substring-search plugin)
# bindkey '^[[A'  history-substring-search-up
# bindkey '^[[B'  history-substring-search-down

# -----------------------------------------------------------------------------
# Editing Helpers
# -----------------------------------------------------------------------------
bindkey '^[.'     insert-last-word      # Alt+.       → insert last argument from prev cmd
bindkey '^T'      transpose-chars       # Ctrl+T      → swap char with previous
bindkey '^[T'     transpose-words       # Alt+T       → swap word with previous
bindkey '^[U'     up-case-word          # Alt+U       → uppercase current word
bindkey '^[L'     down-case-word        # Alt+L       → lowercase current word
bindkey '^[C'     capitalize-word       # Alt+C       → capitalize current word

# -----------------------------------------------------------------------------
# Terminal Pane Resize — Ctrl+Shift+Arrow
# NOTE: Pane resizing is handled by WezTerm (see wezterm_keybindings.lua).
# The escape sequences below are intercepted by WezTerm before reaching ZSH:
#
#   Ctrl+Shift+Left  → shrink pane width
#   Ctrl+Shift+Right → grow pane width
#   Ctrl+Shift+Up    → shrink pane height
#   Ctrl+Shift+Down  → grow pane height
#
# macOS Note: On non-WezTerm terminals you can use AppleScript to resize the
# window. Uncomment and adapt the block below if needed:
# -----------------------------------------------------------------------------
# resize_window_left() {
#   osascript -e 'tell application "Terminal"
#     set bounds of front window to {(item 1 of bounds of front window) - 20, \
#       item 2 of bounds of front window, item 3 of bounds of front window, \
#       item 4 of bounds of front window}
#   end tell'
# }
# zle -N resize_window_left
# bindkey '^[[1;6D' resize_window_left   # Ctrl+Shift+Left

# -----------------------------------------------------------------------------
# Fuzzy Finder (fzf) — if installed
# -----------------------------------------------------------------------------
if command -v fzf &>/dev/null; then
  bindkey '^F' fzf-file-widget         # Ctrl+F      → fzf file picker
  # Source fzf shell integration (Homebrew path)
  local fzf_zsh="$(brew --prefix 2>/dev/null)/opt/fzf/shell/key-bindings.zsh"
  [[ -f "$fzf_zsh" ]] && source "$fzf_zsh"
fi

# -----------------------------------------------------------------------------
# Misc
# -----------------------------------------------------------------------------
bindkey '^L'      clear-screen          # Ctrl+L      → clear screen (keep prompt)
bindkey '^Z'      push-line             # Ctrl+Z      → stash current line, restore after next cmd
bindkey '^[Q'     push-line             # Alt+Q       → same as above (alternative)
bindkey ' '       magic-space           # Space       → expand history (!!, !$, etc.) inline

# -----------------------------------------------------------------------------
# macOS-specific: ensure Delete/Home/End work in all terminal emulators
# (WezTerm handles these natively, but listed here as a safety net)
# -----------------------------------------------------------------------------
bindkey '^[[1~'   beginning-of-line     # Home (some terminals)
bindkey '^[[4~'   end-of-line           # End  (some terminals)
bindkey '^[OH'    beginning-of-line     # Home (xterm mode)
bindkey '^[OF'    end-of-line           # End  (xterm mode)
bindkey '^[[5~'   up-line-or-history    # PgUp
bindkey '^[[6~'   down-line-or-history  # PgDn
