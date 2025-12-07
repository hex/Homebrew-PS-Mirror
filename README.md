# Homebrew Tap for PS Mirror

This tap contains the formula for [PS Mirror Server](https://github.com/hex/PS-Mirror) - a WebSocket relay that bridges Photoshop to iOS for real-time preview.

## Installation

```bash
brew tap hex/ps-mirror
brew install ps-mirror-server
```

## Usage

Run in foreground:
```bash
ps-mirror-server
```

Run on custom port:
```bash
ps-mirror-server --port 9000
```

Run as background service:
```bash
brew services start ps-mirror-server
```

Stop background service:
```bash
brew services stop ps-mirror-server
```

## Requirements

- macOS 12.0+
- Bun (installed automatically by Homebrew)

## Uninstall

```bash
brew uninstall ps-mirror-server
brew untap hex/ps-mirror
```
