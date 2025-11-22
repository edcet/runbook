#!/bin/bash
# Backup dotfiles to timestamped tarball
set -euo pipefail

main() {
  local dest="${1:-$HOME/backups}"
  local timestamp
  timestamp=$(date -u +%Y%m%dT%H%M%SZ)
  local backup_file="$dest/dotfiles-$timestamp.tgz"

  echo "Creating backup: $backup_file"
  mkdir -p "$dest"

  tar -czf "$backup_file" \
    -C "$HOME" \
    .config/atuin \
    .config/zsh \
    .zshrc 2>/dev/null || true

  echo "✅ Backup created: $backup_file"
  echo "📦 Size: $(du -h "$backup_file" | cut -f1)"
}

main "$@"
