-- functionality related to the godot game engine.
-- if project folder contains the .godot folder, listen to the godot engine
--
-- In the Godot Text Editor configs specify the following `External Flags` for running nvim:
--  `--server ./godothost --remote-send "<C-\><C-N>:n {file}<CR>{line}G{col}|`"

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gdscript = {},
      },
    },
  },
  {
    "LazyVim/LazyVim",
    event = "VeryLazy",
    config = function()
      -- Start Godot server if project.godot exists
      local projectFile = io.open(vim.fn.getcwd() .. '/project.godot', 'r')
      if projectFile then
        io.close(projectFile)
        vim.fn.serverstart './godothost'
      end
    end,
  },
}
