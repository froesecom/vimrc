# To clone
clone to ~/

blow away .vim

rename this .vim

## To install plugins

- Install [vim-plug](https://github.com/junegunn/vim-plug)
- `:PlugInstall`.
- Plugins are defined in `.vimrc`

# Relink vimrc
$ ln -s ~/.vim/vimrc/.vimrc ~/.vimrc

$ ln -s ~/.vim/gvimrc ~/.gvimrc

## optional
Install [ripgrep](https://github.com/BurntSushi/ripgrep) for faster fuzzy find

`.vimrc` is setup to use `rg` for `ctl + p` as soon as ripgrep is installed.
You can also use `:Rg [search term]` inside of instead of using `:vimgrep`.

## plugin/custom shortcuts
- `ctrl + e` insert mode, autocomplete htmo
- `space + e` erb tag (print)
- `space + w` erb tag

## install base16shell https://github.com/chriskempson/base16-shell
