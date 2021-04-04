# Dirk's tools and dotfiles

## Create a backup of homebrew settings

```
brew bundle dump
cp Brewfile <target>
```

## Restore your homebrew backup

```
cd <backuptarget>
brew bundle
```
