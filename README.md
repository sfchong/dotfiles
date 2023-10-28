# dotfiles
Clone this project and create symlink to config location

Example:
```
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
```

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

## nnn
Compile from source
```
make O_GITSTATUS=1 O_NERD=1
```

Use alias `n` for cd on quit

In nnn, press `n + f` to create new file

Use `b` to access bookmark, `;` to access plugin key