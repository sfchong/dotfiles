# dotfiles
My personal dotfiles.

Use at your own risk 🙂.

## tmux
Install [TPM](https://github.com/tmux-plugins/tpm)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Install plugin in tmux
```
prefix (Ctrl+a) + I
```
Prefix is re-mapped to Ctrl+a

Handy shortcut
```
prefix + Ctrl + I = install plugin / reload tmux env
prefix + Ctrl + s = save session
prefix + Ctrl + r = reload session
prefix + s = select session
prefix + w = select window
prefix + c = create window
prefix + x = delete window
prefix + ? = help window
```

## neovim
This neovim config uses Packer as plugin manager. First, go to https://github.com/wbthomason/packer.nvim and follow the instruction to install Packer.

To update or sync package
```
:PackerSync
```

To update treesitter
```
:TSUpdate
```
