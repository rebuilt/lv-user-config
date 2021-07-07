O.timeoutlen = 1000
O.plugin.floatterm.active = true
O.plugin.telescope_project.active = true
O.format_on_save = false

local conf = require("lv-user-config.current.config")

O.user_plugins = {
{"rhysd/accelerated-jk",
    opt = true
},

{"norcalli/nvim-colorizer.lua",
    ft = {"html", "css", "sass", "vim", "typescript", "typescriptreact", "scss", "eruby"},
    config = conf.nvim_colorizer,
},

{"itchyny/vim-cursorword",
    event = {"BufEnter", "BufNewFile"},
    config = conf.vim_cursorwod
},

{"tpope/vim-surround",
    keys = {"c","d","y"},
},

{"tpope/vim-commentary",
    keys = "g",
    requires = {"JoosepAlviste/nvim-ts-context-commentstring"},
},

{"tpope/vim-repeat",
  event = {"InsertEnter"},
},

{"tpope/vim-apathy",
  ft =  {"c", "cpp", "go", "javascript", "typescript", "javascriptreact", "typescriptreact", "coffeescript", "lua", "python", "scheme", "bash", "markdown"},
},

{"kana/vim-niceblock",
    opt = true
},

{"airblade/vim-rooter",event = "BufEnter"},

{"ray-x/lsp_signature.nvim",
    event = {"InsertEnter"},
    config = function()
        require "lsp_signature".on_attach()
    end
},

{"andymass/vim-matchup",
    keys = "%"
},

{"f-person/git-blame.nvim",
    cmd = "GitBlameToggle",
    config = conf.gitblame
},

{'christoomey/vim-sort-motion',
  keys = "gs"
},

{"kristijanhusak/vim-dadbod-ui",
    cmd = {"DBUIToggle", "DBUIAddConnection", "DBUI", "DBUIFindBuffer", "DBUIRenameBuffer"},
    config = conf.vim_dadbod_ui,
    requires = {{"tpope/vim-dadbod", opt = true},}
},

{"unblevable/quick-scope",
    keys = {"f", "F", "t", "T"},
},

{"liuchengxu/vista.vim",
    cmd = "Vista",
    config = conf.vim_vista
},

{"iamcco/markdown-preview.nvim",
    ft = "markdown",
    run = ":call mkdp#util#install()",
    config = function()
        vim.g.mkdp_auto_start = 1
    end
},

{"tpope/vim-fugitive",
    cmd = {
        "G",
        "Git",
        "Gdiffsplit",
        "Gread",
        "Gwrite",
        "Ggrep",
        "GMove",
        "GDelete",
        "GBrowse",
        "GRemove",
        "GRename",
        "Glgrep",
        "Gedit"
    },
    ft = {"fugitive"},
},

{"tpope/vim-rails",
    cmd = {
        "Eview",
        "Econtroller",
        "Emodel",
        "Smodel",
        "Sview",
        "Scontroller",
        "Vmodel",
        "Vview",
        "Vcontroller",
        "Tmodel",
        "Tview",
        "Tcontroller",
        "Rails",
        "Generate",
        "Runner",
        "Extract"
    },
},

{"tpope/vim-bundler",
  cmd = {"Bundler", "Bopen", "Bsplit", "Btabedit"},
},

{"turbio/bracey.vim",
    cmd = {"Bracey", "BracyStop", "BraceyReload", "BraceyEval"},
    run = "npm install --prefix server"
},

{"mfussenegger/nvim-dap",
    config = conf.dap
},

-- {"akinsho/nvim-bufferline.lua",
--     event = "BufEnter",
--     config = conf.nvim_bufferline,
--     requires = {"kyazdani42/nvim-web-devicons"},
-- },

{"kyazdani42/nvim-tree.lua",
    cmd = {"NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFindFile"},
    config = conf.nvim_tree,
    requires = {"kyazdani42/nvim-web-devicons"},
},

{"lewis6991/gitsigns.nvim",
    event = {"BufEnter"},
    config = conf.gitsigns,
    requires = {"nvim-lua/plenary.nvim", opt = true},
},

{"folke/which-key.nvim",
    event = {"BufEnter"},
    config = conf.which_key
},

-- yay -S glow
{"npxbr/glow.nvim",
    ft = {"markdown"},
    -- run = "yay -S glow"
},

{"kevinhwang91/nvim-bqf",
    -- event = "BufEnter",
    event = "QuickFixCmdPre",
    config = conf.bqf
},

{"folke/trouble.nvim",
    cmd = {"Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh"},
    requires = {"kyazdani42/nvim-web-devicons"},
    config = conf.trouble
},

{"phaazon/hop.nvim",
    -- cmd = {"HopWord", "HopLine", "HopChar1", "HopChar2", "HopPattern"},
    as = "hop",
    keys = {"gl", "<Leader>h"},
    config = conf.hop
},
}
