This project is a way to manage LunarVim configuration files. The approach is to use a external git repository or a git submodule to separate out the two concerns: user-specific configuration from LunarVim core configuration. This means a user can create their own configuration files in their own repos. Changes will be tracked in their own git submodule.

Having a separate repo also enables users to share configurations with one another. It means we might also create a marketplace for different modes: web development, script-writing, document creation, etc.

Modes can easily be switched by changing a symlink to a different folder. As long as it contains a init.lua file, it will work

# Installation

First install [LunarVim](https://github.com/ChristianChiarulli/LunarVim)

## Installing to an external directory

Clone this repository to the ~/.config folder

```
git clone https://github.com/rebuilt/lv-user-config.git ~/.config/lunarvim
```

Back up your lv-config.lua file

```
mv ~/.config/nvim/lv-config.lua PATH_OF_YOUR_CHOICE
```

Then create the symlinks

```
ln -s ~/.config/nvim/lua/lv-user-config/current/init.lua ~/.config/nvim/lv-config.lua
ln -s ~/.config/lunarvim/ ~/.config/nvim/lua/lv-user-config
```

## Optional install as a git submodule

Clone this repository as a submodule inside LunarVim

```bash
cd ~/.config/nvim/lua && git submodule add -f https://github.com/rebuilt/lv-user-config.git
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
| current          | This is a symlink that points to the set of configurations you'd like to use. It points to the 'example' folder. To use another set of configurations, point the symlink to another folder. This way you can easily switch between 'modes', or try out someone else's set of configurations |
| init.lua | init.lua is the main file that will be sourced. This is the only required file.  The example project shows you how you might split up your configuration into different files                                                                                                               |
| example | The files in this folder demonstrate how to split your configuration into multiple files. Do not write your configuration here.  Copy the folder instead.  Otherwise, if you want to pull updates, you may get conflicts.|

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

## Notes

If you were one of the first people to clone the repo, your git submodule will be named lv-user-configs (plural).   LunarVim has decided to go with the singular: lv-user-config .  So, to make sure the git submodule is correctly ignored, change the name of the folder to lv-user-config. You will also need to rename all instances of lv-user-configs to singular in init.lua and plugins.lua 
