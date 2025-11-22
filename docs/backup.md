---
tags: [runbook, backup, restic]
created: {{date}}
---

# Backup Strategy

Uses **restic** (not tar) for encrypted, deduplicated backups.

## Initialize Repository (One-time)

```bash
just init-backup
```

## Create Backup

```bash
just backup
```

This backs up:
- `~/.config/atuin` - Shell history + KV store
- `~/.config/zsh` - ZSH configuration  
- `~/.zshrc` - Shell entry point

## Restore

```bash
just restore
```

## View Snapshots

```bash
just backup-ls
```

## Atuin KV Integration

Last backup timestamp is stored in Atuin KV:

```bash
atuin kv get "backup:last_run"
```

## Related

- [[restic-config]] - Restic configuration
- [[atuin-kv]] - Atuin key-value store
