local conf = require "lv-user-configs.current.plugin-configs"
-- Additional Plugins
O.user_plugins = {
    {
        "norcalli/nvim-colorizer.lua",
        ft = {"html", "css", "sass", "vim", "typescript", "typescriptreact", "scss", "eruby"},
        config = conf.nvim_colorizer
    }
}
