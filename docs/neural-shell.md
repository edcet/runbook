---
tags: [architecture, rust, shell]
created: {{date}}
---

# The Neural Shell

A hyper-integrated, Rust-native shell environment.

## Components

| Tool | Role | Command |
| :--- | :--- | :--- |
| **Zellij** | Multiplexer | `zrun` (opens runbook layout) |
| **Yazi** | File Manager | `yazi` (or `ya`) |
| **Pueue** | Task Queue | `pueue add "cmd"`, `pueue status` |
| **Carapace** | Completions | Auto-triggered on `<TAB>` |
| **Cloak** | Secrets | `cloak run -- cmd` |
| **Vivid** | Colors | Auto-loaded in `ls` / `eza` |

## Workflow

### 1. Start Working
```bash
zrun
```
Opens a Zellij session with:
- **Editor** (nvim)
- **Files** (yazi)
- **Tasks** (pueue monitor)

### 2. Long-Running Tasks
Don't block your shell. Send it to the daemon:
```bash
pueue add "cargo build --release"
pueue add "restic backup ..."
```
Watch progress in the "Tasks" pane.

### 3. Secrets
Never export secrets. Inject them JIT:
```bash
cloak run -- ./deploy.sh
```

### 4. Navigation
Use `yazi` to browse. Press `<Enter>` on a directory to enter it.
(Integration: Yazi can tell Zellij to open a new pane)

## Configuration

- **Zellij**: `~/.config/zellij/config.kdl`
- **Yazi**: `~/.config/yazi/yazi.toml`
- **Pueue**: `~/.config/pueue/pueue.yml`
