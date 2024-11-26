# .dotfiles

_Give me six hours to chop down a tree and I will spend the first four sharpening the axe.        ~Abraham Lincoln_

The core inspiration behind this repository is the above notion. 
(the sauce - [original](https://old.reddit.com/r/QuotesPorn/comments/kxtqga/give_me_six_hours_to_chop_down_a_tree_and_i_will/), [perma](https://web.archive.org/web/20210120192810/https://old.reddit.com/r/QuotesPorn/comments/kxtqga/give_me_six_hours_to_chop_down_a_tree_and_i_will/))

This tree is meant for dotfiles management in the system. It comprises of the
config files essential to the specific utils. I am using this tree in
conjunction with [`stow`](https://www.gnu.org/software/stow/manual/stow.html) for easier management of config 
files.
Stow creates symlinks to the config files at target locations, with installation
image heirarchy being specified in the package directory. Know more about the
terminology [here](https://www.gnu.org/software/stow/manual/stow.html#Terminology).

For this case:
* `.dotfiles` is the stow directory. Full path: `~/.dotfiles`
* `~/` is the target directory. It usually is the parent of stow dir, unless
  specific explicitly.

For a package, say `nvim`, 
* It's installation image would be:

```
/nvim
    ├── after
    │   └── plugin
    │       ├── cfg_plugin_1.lua
    │       └── cfg_plugin_2.lua
    ├── init.lua
    ├── lua
    │   └── dir
    │       └── stuff.lua
    └── plugin
        └── packer_compiled.lua
```

And this installation image would need to be inside `~/.config/`
So, for nvim, the target dir would be `~/.config`. Upon running `stow nvim`
(inside stow directory, `~/.dotfiles` in this case) stow will create a dir named
`nvim` inside `~/.config` dir. This will be happening because we are keeping the
nvim config in a separate nvim dir nested inside our stow dir with the target
dir path(for nvim, `~/.config/nvim` in this case) in it.


In order to stow a config file:
* Make sure it does not exist already inside target dir
* Change to a stow directory now(i.e., `cd .dotfiles` in this case)
* Place it's config in a separate nested dir inside stow dir(i.e., `mkdir to-be-tracked ; echo content > to-be-tracked/cfg`)
* `stow` that dir(i.e., `stow to-be-tracked`).
* Changes will now be reflected, that file will be visible in the target dir(check via, `ls -a ~/ | grep to-be-tracked`).
* Also, after updating the zshrc, it needs not be sourced if updated in the stow dir **and** `stow`ed too.

fwiw, this has been done via docs solely, and a blog, [link](https://web.archive.org/web/20230924171233/https://stevenrbaker.com/tech/managing-dotfiles-with-gnu-stow.html).

## Installation
1. `nvim`
- Install `nvim` firstly from relevant package manager
- Install `Packer` from [here](https://github.com/wbthomason/packer.nvim#quickstart)
- Execute `stow nvim`
- Source the `packer.lua` file via `:so` or `:%so`
- `:PackerSync` & `:PackerInstall`
- `:LspInstall` within `packer.lua`
- It should be ready now
- (backup one config if they happen to conflict, `cp init.vim init.vim.bkp`)
