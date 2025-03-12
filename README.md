# Setup
1. Install nvim
2. Create nvim dir in `~/.config/nvim`
```zsh
mkdir -p ~/.config/nvim
```
3. Install Packer
4. Install zig or gcc
7. Install node & npm
8. :so in init.lua
9. :PackerSync

# Recommendations
1. Install ripgrep
    - `brew install ripgrep`
    - This will make telescope (searching files) faster.

# Using Molten
1. Install using Packer
2. Activate venv
3. Install the necessary Packages
```zsh
pip install pynvim jupyter-client
```
4. Open nvim and run UpdateRemotePlugins
```nvim
:UpdateRemorePlugins
```
5. Open `.ipynb` file and have fun.
