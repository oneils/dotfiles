-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- M.base46 = {
--   theme = "catppuccin",
--   transparency = true,
--   theme_toggle = { "catppuccin", "gruvbox" },
-- }
--
M.base46 = {
  theme = "catppuccin",
  transparency = false,
  theme_toggle = { "catppuccin", "gruvchad" },

  -- hl_override = {
  --   Normal = { bg = "NONE", fg = nil },
  -- },
}

-- M.ui = {
--   theme = "catppuccin",
--   -- transparency = true,
--   theme_toggle = { "catppuccin", "gruvchad" },
--
--   hl_override = {
--     Normal = { bg = "NONE", fg = nil },
--   },
-- }
-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
