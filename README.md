# .dotfiles

<!--toc:start-->
- [.dotfiles](#dotfiles)
    - [How to configure?](#how-to-configure)
    - [WallPapers](#wallpapers)
<!--toc:end-->

This repository contains the configuration of my personal workflow.

### How to configure?

Clone the repository in home directory

> $ cd ~
> $ git clone https://github.com/Tsuzat/.dotfiles

Add a symbolic link to map the configuration

> $ ln -s ~/.dotfiles/kitty ~/.config/kitty

> $ ln -s ~/.dotfiles/nvim ~/.config/nvim

> $ ln -s ~/.dotfiles/alacritty ~/.config/alacritty

Run the `neovim` and install packages

> $ nvim +PackerSync

- Note that you may face issue installing `NeoSolarized.nvim` as it is installed locally in NeoVim configuration. In that condition, you can edit code to `use ("Tsuzat/NeoSolarized.nvim")`or refer to https://github.com/Tsuzat/NeoSolarized.nvim.

### WallPapers

There are 50+ awesome wallpapers to begin with. Feel free to use them. [Link](https://drive.google.com/drive/folders/1l74wvr9LTLbuvgUu35o09AykuU5pu2Mt?usp=sharing)
