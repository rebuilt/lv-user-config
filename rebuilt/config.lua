local config = {}

function config.nvim_colorizer()
    local defaults = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        mode = "background" -- Set the display mode.
    }

    require "colorizer".setup {
        -- css = {rgb_fn = true},
        -- scss = {rgb_fn = true},
        -- sass = {rgb_fn = true},
        css = defaults,
        scss = defaults,
        sass = defaults,
        html = defaults,
        stylus = {rgb_fn = true},
        vim = {names = true},
        tmux = {names = false},
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact"
    }
end

function config.vim_cursorword()
    vim.api.nvim_command("augroup user_plugin_cursorword")
    vim.api.nvim_command("autocmd!")
    vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
    vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
    vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
    vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
    vim.api.nvim_command("augroup END")
end

function config.neoformat()
    vim.cmd([[
    augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
    augroup END
    ]])
end

function config.gitblame()
    vim.cmd("highlight default link gitblame SpecialComment")
    vim.g.gitblame_enabled = 0
end

function config.commentstring()
    require "nvim-treesitter.configs".setup {
        context_commentstring = {
            enable = true
        }
    }
end

function config.vim_vista()
    vim.g["vista#renderer#enable_icon"] = 1
    vim.g.vista_disable_statusline = 1
    vim.g.vista_default_executive = "ctags"
    vim.g.vista_echo_cursor_strategy = "floating_win"
    vim.g.vista_vimwiki_executive = "markdown"
    vim.g.vista_executive_for = {
        vimwiki = "markdown",
        pandoc = "markdown",
        markdown = "toc",
        typescript = "nvim_lsp",
        typescriptreact = "nvim_lsp"
    }
end

function config.dap()
    vim.cmd(
        [[
    nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
    nnoremap <silent> <F6> :lua require'dap'.step_over()<CR>
    nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
    nnoremap <silent> <F8> :lua require'dap'.step_out()<CR>
    nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
    nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
]]
    )
    local dap = require("dap")
    dap.adapters.ruby = {
        type = "executable",
        command = "bundle",
        args = {"exec", "readapt", "stdio"}
    }

    dap.configurations.ruby = {
        {
            type = "ruby",
            request = "launch",
            name = "Rails",
            program = "bundle",
            programArgs = {"exec", "rails", "s"},
            useBundler = true
        }
    }
end

function config.nvim_bufferline()
    require("bufferline").setup {
        options = {
            modified_icon = "✥",
            buffer_close_icon = "",
            mappings = false,
            always_show_bufferline = false
        }
    }
end

function config.hop()
    require "hop".setup {keys = "etovxqpdygfblzhckisuran"}
    vim.api.nvim_set_keymap("n", "<Leader>h", "<cmd>lua require'hop'.hint_words()<cr>", {})
    vim.api.nvim_set_keymap("n", "gl", ":HopWord<cr>", {})
end

return config
