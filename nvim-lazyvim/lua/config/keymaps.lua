-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("i", "jj", "<ESC>")

-- Markdown headers (only in markdown files)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Markdown header mappings with leader+m
    map("n", "<leader>m1", "I# <Esc>", { desc = "Insert H1 header", buffer = true })
    map("n", "<leader>m2", "I## <Esc>", { desc = "Insert H2 header", buffer = true })
    map("n", "<leader>m3", "I### <Esc>", { desc = "Insert H3 header", buffer = true })
    map("n", "<leader>m4", "I#### <Esc>", { desc = "Insert H4 header", buffer = true })
    map("n", "<leader>m5", "I##### <Esc>", { desc = "Insert H5 header", buffer = true })
    map("n", "<leader>m6", "I###### <Esc>", { desc = "Insert H6 header", buffer = true })
  end,
})
