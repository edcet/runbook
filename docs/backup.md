---
tags: [script, backup, dotfiles]
created: 2025-11-21
version: 1.0.0
usage: backup [DEST_DIR]
---

# backup

Creates a timestamped tarball backup of dotfiles.

## Why

Your dotfiles contain critical system configuration. Regular backups ensure you can recover from:
- Accidental deletions
- Failed experiments
- System migrations

## Usage

```bash
# Backup to default location (~/backups)
backup

# Backup to custom location
backup /path/to/backup/dir
```

## What Gets Backed Up

- `~/.config/atuin` - Shell history and KV store
- `~/.config/zsh` - ZSH configuration
- `~/.zshrc` - Shell entry point

## Implementation

```bash
{{< include "../scripts/backup.sh" >}}
```

## Recovery

To restore from a backup:

```bash
cd ~
tar -xzf ~/backups/dotfiles-TIMESTAMP.tgz
```

## Related

- [[restore]] - Restore from backup (TODO)
- [[sync]] - Sync dotfiles to remote (TODO)
