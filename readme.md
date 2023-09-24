# .dotfiles

This tree is meant for dotfiles management in the system. It comprises of the
config files essential to the specific utils. I am using this tree in
conjunction with [`stow`](https://www.gnu.org/software/stow/manual/stow.html#Introduction) for easier management of config 
files.
Stow creates symlinks to the config files at target locations, with installation
image heirarchy being specified in the package directory. Know more about the
terminology [here](https://www.gnu.org/software/stow/manual/stow.html#Terminology).

For this case:
* `.dotfiles` is the stow directory. Full path: `~/Desktop/user_name/.dotfiles`
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
* Place it's config in a separate nested dir inside stow dir
* stow that dir.
* Changes will now be reflected, that file will be visible in the target dir.
* Also, after updating the zshrc, it needs not be sourced if updated in the stow
  dir and `stow`ed too.

fwiw, this has been done via docs solely, and a blog, [link](https://stevenrbaker.com/tech/managing-dotfiles-with-gnu-stow.html).
