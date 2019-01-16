Dirk's dotfiles

# Some notes on how I maintain them

## Initializing submodules

```bash
git submodule init
```

## Adding a submodule

```bash
git submodule add https://github.com/python-mode/python-mode.git vim/packages/start/python-mode
cd vim/packages/start/python-mode
git submodule update --init --recursive
```

