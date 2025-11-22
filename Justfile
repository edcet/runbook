# Runbook - Native CLI Composition
# No wrapper scripts, just compose existing tools

# Backup dotfiles with restic (encrypted, deduplicated)
backup:
    restic backup ~/.config/atuin ~/.config/zsh ~/.zshrc \
        --repo ~/backups/restic \
        --tag dotfiles \
        --exclude-caches
    atuin kv set "backup:last_run" "$(date -u +%s)"

# Restore from latest backup
restore:
    restic restore latest \
        --repo ~/backups/restic \
        --target ~ \
        --tag dotfiles

# Search across all markdown docs
search QUERY:
    rg --type md "{{QUERY}}" docs/

# Sync atuin state
sync:
    atuin sync
    atuin dotfiles sync

# List all atuin scripts
list:
    atuin scripts list

# Show atuin KV store
kv-list:
    atuin kv list

# Generate completion spec with carapace
completion SCRIPT:
    carapace {{SCRIPT}}

# Initialize restic repo (one-time)
init-backup:
    restic init --repo ~/backups/restic

# Show what's in backup
backup-ls:
    restic snapshots --repo ~/backups/restic
