return
    {
        "lervag/vimtex",  -- LaTeX plugin
        ft = "tex",
        config = function()
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1
            -- Compiler
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.vimtex_compiler_latexmk = {
                build_dir = 'build',
                continuous = 1,       -- live compilation
                executable = 'latexmk',
                options = {
                    '-pdf',
                    '-shell-escape',
                    '-verbose',
                    '-interaction=nonstopmode',
                    '-synctex=1'
                }
            }

            -- Viewer
            vim.g.vimtex_view_method = 'skim'
            vim.g.vimtex_view_skim_sync = 1
            vim.g.vimtex_view_skim_activate = 0

            -- Optional but recommended: focus Neovim after inverse search
            vim.g.vimtex_view_skim_reading_bar = 1


            -- Error handling
            vim.g.vimtex_quickfix_mode = 0

            -- Keybinds
            local opts = { noremap = true, silent = true }
            vim.api.nvim_set_keymap('n', '<leader>lc', '<cmd>VimtexCompile<CR>', opts)
            vim.api.nvim_set_keymap('n', '<leader>lv', '<cmd>VimtexView<CR>', opts)
            vim.api.nvim_set_keymap('n', '<leader>le', '<cmd>VimtexErrors<CR>', opts)
            vim.api.nvim_set_keymap('n', '<leader>ls', '<cmd>VimtexStop<CR>', opts)
        end
    }
