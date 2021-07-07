This project is a way to manage LunarVim configuration files. The approach is to use a git submodule to separate out the two concerns: user-specific configuration from LunarVim core configuration. This means a user can create their own configuration files in their own repos. Changes will be tracked in their own git submodule. This will lead to fewer breaking changes for users of LunarVim.

Having a separate repo do all this also enables users to share configurations with one another. It means we might also create a marketplace for different modes: web development, script-writing, document creation, etc.

Modes can easily be switched by changing a symlink to a different folder. As long as it contains a init.lua file, it will work

# Installation

First install [LunarVim](https://github.com/ChristianChiarulli/LunarVim)

Clone this repository as a submodule inside LunarVim

```bash
cd ~/.config/nvim/lua && git submodule add https://github.com/rebuilt/lv-user-configs.git
```

Create a symlink to hook up the main configuration file

```
ln -s ~/.config/nvim/lua/lv-user-configs/current/init.lua lv-config.lua
```

Install plugins

```
:PackerSync
```
