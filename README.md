# Neovimfiles

This is my current neovim (nvim) setup files.

There are many like it but this one is mine. This is not intended as a distribution. Therefore, you can expect things to change on a whim. Feel free to look around and steal ideas though.

I'm trying to use nvim as my primary development environment. Therefore, it's configured to my current preference and needs. The plugins are managed with '[lazy.nvim](https://github.com/folke/lazy.nvim)' and the setup is tested only on Neovim >= v0.10.2 on Linux.


## How to use

- Use the repo as the 'nvim' directory (e.g., `~/.config/nvim/`).
- Plugins will be automatically installed on the first subsequent nvim run.
- Once plugins and dependencies are ready, run `:Lazy update` to update.
- Leader key is "Space".

More information will be added in future.

### Dependencies

Current external dependencies mainly reflect my current needs (e.g., copy to clipboard while using wayland, rust_analyzer integration).
- `wl-copy`         e.g., $ sudo dnf install wl-clipboard
- `ripgrep`         e.g., $ sudo dnf install ripgrep
- `universal-ctags` e.g., $ sudo dnf install ctags
- `rust_analyzer`   e.g., $ rustup component add rust-analyzer


## Structure

This repository is organized into the following structure.

```
nvim/
├── README.md                   This file
├── init.lua                    Main file, used here to import other files
└── lua/                        Directory containing lua files of the setup
    ├── config/
    │   ├── options.lua         Main config file (e.g., options, commands)
    │   ├── lazy.lua            Plugin Manager configuration
    │   └── colorschemes/       Directory for custom configs for colorschemes
    │       ├── catppuccin.lua
    │       └── ...
    ├── keymaps/
    │   ├── main.lua            Main keymaps of the setup
    │   └── plugins.lua         Manually assigned custom keymaps for plugins
    └── plugins/                Directory for autoloading plugins/plugin groups
        ├── bufferline.lua
        ├── leap.lua
        ├── ...
        └── ...
```
The order in which these configuration files are imported (e.g., in 'nvim/init.lua') is important because the latter imports may depend on the former ones. Therefore, any incorrect lua file can prevent the setup from working as intended.

When `lazy.nvim` is imported, it in turn loads all *.lua files under 'nvim/lua/plugins/' directory automatically, as long as they are valid for loading plugins.


## Changes from my other vimfiles

I already have long existing set of [my vimfiles](https://github.com/gaveen/vimfiles) which I have also [explained in detail](https://gaveen.me/2020/02/my-vim-story/). I will continue to use plain old vim because my use cases for vim and nvim are currently different. For example, I set up nvim as an environment for coding and writing in my personal computers. But vim (and the grand old 'vi') is the editor I can expect to find in almost every system I log into. Therefore, while my nvim setup can be optimized for productivity, I still need to use vim for everything else.

Since neovim is almost a superset of vim (in a way like vim was for vi), there's not much to be concerned about. As a bonus, I was able to remove a bunch of configuration options I had to explicitly set in vim because of the [differences between vim and neovim](https://neovim.io/doc/user/vim_diff.html#vim-differences).

This nvim setup covers almost everything in my vimfiles and then some. Most of the old vim plugins have been replaced by modern alternatives giving this setup much better LSP and DAP integration, syntax handling, code/text completion features, and more.


## Future Improvements

This repository will be updated in future whenever I need to make improvements, tweaks and other changes necessary for my use.
