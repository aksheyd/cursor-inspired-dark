# Cursor Inspired Dark

My personal VS Code / Cursor color theme. Lives here so I can sync it across
laptops without remembering anything fancy.

## Install on a new laptop (the easy way)

```bash
git clone git@github.com:aksheyd/custom-theme.git ~/custom-theme
cd ~/custom-theme
./install.sh
```

That's it. Restart VS Code / Cursor, then:

- `Cmd+K Cmd+T` → pick **Cursor Inspired Dark**

The script symlinks this repo into your editor's extensions directory, so any
`git pull` here instantly updates the theme — no rebuild, no reinstall.

By default it installs into both VS Code and Cursor if they exist. To target one:

```bash
./install.sh code      # VS Code only
./install.sh cursor    # Cursor only
```

## Updating the theme

Edit `themes/cursor-inspired-dark.json`, reload the editor window
(`Cmd+Shift+P` → "Reload Window"), and the changes show up immediately.

To share the changes with your other laptops:

```bash
git add themes/cursor-inspired-dark.json
git commit -m "tweak colors"
git push
```

On the other laptop:

```bash
cd ~/custom-theme && git pull
# Reload Window in your editor
```

## Uninstall

```bash
rm ~/.vscode/extensions/cursor-inspired-dark
rm ~/.cursor/extensions/cursor-inspired-dark
```

## Layout

- `package.json` — extension manifest
- `themes/cursor-inspired-dark.json` — the actual color definitions
- `install.sh` — symlinks this repo into your editor's extensions dir
