This project is a way to manage LunarVim configuration files. The approach is to use a git submodule to separate out the two concerns: user-specific configuration from LunarVim core configuration. This means a user can create their own configuration files in their own repos. Changes will be tracked in their own git submodule.

Having a separate repo also enables users to share configurations with one another. It means we might also create a marketplace for different modes: web development, script-writing, document creation, etc.

Modes can easily be switched by changing a symlink to a different folder. As long as it contains a init.lua file, it will work

# Installation

First install [LunarVim](https://github.com/ChristianChiarulli/LunarVim)

Clone this repository as a submodule inside LunarVim

```bash
cd ~/.config/nvim/lua && git submodule add https://github.com/rebuilt/lv-user-config.git
```

Back up your lv-config.lua file

```
mv ~/.config/nvim/lv-config.lua PATH_OF_YOUR_CHOICE
```

Create a symlink to hook up the main configuration file

```
ln -s ~/.config/nvim/lua/lv-user-config/current/init.lua ~/.config/nvim/lv-config.lua
```

Install plugins

```
:PackerSync
```

# Getting Started

The new git submodule will be located in ~/.config/nvim/lua/lv-user-config/

## Important files

| Files/Folders    | Description                                                                                                                                                                                 |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| current          | This is a symlink that points to the set of configurations you'd like to use. It points to the 'default' folder. To use another set of configurations, point the symlink to another folder. |
| default/init.lua | This is the main file that will be sourced. This is the only required file.                                                                                                                 |

## Use a different set of configurations

Remove the 'current' symlink

```
rm current
```

Define a new symlink

```
ln -s <directory> current
```

## Sharing your configuration with others

If you have a configuration you're proud of, create a pull request and I'll add your configs for others to use
