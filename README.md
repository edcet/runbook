# Runbook

Executable scripts with quality gates, synced across machines via Atuin.

## Structure

- `scripts/` - Executable shell scripts (single-word names only)
- `docs/` - Markdown documentation for each script
- `.github/workflows/quality.yml` - Automated quality gates

## Quality Standards

All scripts must pass:
- **ShellCheck**: Syntax and best practices
- **shfmt**: Consistent formatting (-i 2 -ci -sr)
- **Naming**: Single lowercase word only (e.g., `backup`, `deploy`)

## Usage

### Via Atuin (Recommended)
```bash
# Clone to Atuin scripts directory
git clone https://github.com/edcet/runbook ~/.local/share/atuin/scripts

# List all scripts
atuin scripts list

# Run a script
atuin scripts run backup
```

### Direct Execution
```bash
# Add to PATH
export PATH="$HOME/runbook/scripts:$PATH"

# Run directly
backup
```

##Sync

Scripts automatically sync across machines via:
- **Atuin**: Built-in E2E encrypted sync
- **Obsidian Git**: Auto-pull every 5 minutes

## Creating Scripts

1. Create `scripts/name.sh` (single word, lowercase)
2. Create `docs/name.md` (documentation)
3. Commit and push
4. GitHub Actions validates quality
5. Other machines pull automatically
