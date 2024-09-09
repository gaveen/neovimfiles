# Neovimfiles

This is my current neovim (nvim) setup files.

It's not intended to be a distribution. I'm trying to use nvim as my primary development environment. Therefore, it's configured up to my preferences and subject to change at my whims. Feel free to look around and steal ideas though.

This nvim setup covers about 95% features of my [vimfiles](https://Tithub.com/gaveen/vimfiles) and much more. Most of the old vim plugins have been replaced by modern alternatives. This gives this setup much better LSP and DAP integration, syntax handling, and completion features among other nice things. This is also why a lot of developer workflow related plugins are enabled by default.

The plugins are managed with ['lazy.nvim'](https://github.com/folke/lazy.nvim) and the setup is tested only on Neovim > v0.10.1 on Linux. When porting over from my vim configuration, I updated things to account for the [differences between vim and neovim](https://neovim.io/doc/user/vim_diff.html#vim-differences). Therefore, the configuration should be better organized.

## Structure

This repository follows a structure similar to the below.

```
nvim/
├─ lua/                     directory containing lua files of the setup
│  ├─ config/
│  │  ├─ colorschemes/      directory for custom configuration for colorschemes
│  │  │  ├─ catppuccin.lua
│  │  ├─ lazy.lua           plugin manager configuration
│  │  ├─ options.lua        main configuration (e.g., options, commands)
│  ├─ keymaps/
│  │  ├─ main.lua           main keymaps
│  │  ├─ plugins.lua        manually assigned custom keymaps for plugins
│  ├─ plugins/              automatically loaded pugin/group configuration files
│  │  ├─ bufferline.lua
│  │  ├─ cmp.lua
│  │  ├─ ...
│  │  ├─ which-key.lua
init.lua                    main configuration, used to import other files
README.md
```

## How to use

- Use the repo as the 'nvim' directory.
- Plugins will be automatically installed on the first run.
- Run `:Lazy update` to update.
- Leader key is "Space".

More information will be added in future.

### Dependencies

Current external dependencies mainly reflect my current needs (e.g., wayland support, rust_analyzer integration).
- `ripgrep`
- `rust_analyzer`
- `wl-copy`

## Future Improvements

This repository will be updated in future whenever I need. It'll usually be for improvements, tweaks and other changes necessary for my use.

One potential cosmetic change under consideration is adopting `ui` and `theme` plugins from the ["NvChad"](https://nvchad.com/) project when they make them easier to be used by others.
