return {
    {
      'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        config = function ()
            require("oil").setup {
                columns = { "icon" },
                view_options = {
                    show_hidden = true,
                },
            }

            -- open parent directory in current window
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end
    }
}
