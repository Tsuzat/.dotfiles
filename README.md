# .dotfiles
All my important dotfiles in one place.

<!--toc:start-->
- [.dotfiles](#dotfiles)
    - [How to configure?](#how-to-configure)
    - [WallPapers](#wallpapers)
<!--toc:end-->

This repository contains the configuration of my personal workflow.

### How to configure?

Download and Install your favorite packages (`Arch Linux`)

```sh
$ sudo pacman -S neovim kitty
```

Clone the repository in home directory

```sh
$ cd ~
$ git clone https://github.com/Tsuzat/.dotfiles
```

Add a symbolic link to map the configuration

```sh
$ ln -s ~/.dotfiles/kitty ~/.config/
$ ln -s ~/.dotfiles/nvim ~/.config/
$ ln -s ~/.dotfiles/alacritty ~/.config/
```

- Run the `neovim` and [`lazy.nvim`](https://github.com/folke/lazy.nvim) will download all plugins. 

### WallPapers

There are 50+ awesome wallpapers to begin with. Feel free to use them. [Link](https://drive.google.com/drive/folders/1nyIBvcuf5KrLB0_exnChQmoTCNAmdMi_?usp=sharing)
