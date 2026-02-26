# Neovimfiles

This is my current neovim (nvim) setup files.

There are many like it but this one is mine. This is not intended as a distribution. Therefore, you can expect things to change on a whim. Feel free to look around and steal ideas though.

I'm trying to use nvim as my primary development environment. Therefore, it's configured to my current preference and needs. The plugins are managed with '[lazy.nvim](https://github.com/folke/lazy.nvim)' and the setup is tested only on Neovim >= v0.10.2 on Linux.


## How to use

- Use the repo as the 'nvim' directory. e.g., `git clone https://github.com/gaveen/neovimfiles ~/.config/nvim`
- Plugins will be automatically installed on the first subsequent nvim run.
- Once plugins and dependencies are ready, run `:Lazy update` to update.
- Leader key is "Space".

More information will be added in future.

### Dependencies

Current external dependencies mainly reflect my current needs (e.g., copy to clipboard while using wayland, etc.)
- `wl-copy`         e.g., $ sudo dnf install wl-clipboard
- `ripgrep`         e.g., $ sudo dnf install ripgrep
- `curl`            e.g., $ sudo dnf install curl
- `tar`             e.g., $ sudo dnf install tar


## Structure

This repository is organized into the following structure.

```
nvim/
├── README.md                   This README file
├── init.lua                    Main config file of the setup
└── lua/                        Directory containing additional lua files
    ├── config/
    │   ├── lazy.lua            Plugin Manager configuration
    └── plugins/                Directory for autoloading plugins
        ├── bufferline.lua
        ├── leap.lua
        ├── ...
        └── ...
```

When `lazy.nvim` is imported, it in turn loads all *.lua files under 'nvim/lua/plugins/' directory automatically, as long as they are valid for loading plugins.


## Changes from my other vimfiles

I already have long existing set of [my vimfiles](https://github.com/gaveen/vimfiles) which I have also [explained in detail](https://gaveen.me/2020/02/my-vim-story/). I will continue to use plain old vim because my use cases for vim and nvim are currently different. For example, I set up nvim as an environment for coding and writing in my personal computers. But vim (and the grand old 'vi') is the editor I can expect to find in almost every system I log into. Therefore, while my nvim setup can be optimized for productivity, I still need to use vim for everything else.

Since neovim is almost a superset of vim (in a way like vim was for vi), there's not much to be concerned about. As a bonus, I was able to remove a bunch of configuration options I had to explicitly set in vim because of the [differences between vim and neovim](https://neovim.io/doc/user/vim_diff.html#vim-differences).

This nvim setup covers almost everything in my vimfiles and then some. Most of the old vim plugins have been replaced by modern alternatives giving this setup much better LSP and DAP integration, syntax handling, code/text completion features, and more.


## Future Improvements

This repository will be updated in future whenever I need to make improvements, tweaks and other changes necessary for my use.
