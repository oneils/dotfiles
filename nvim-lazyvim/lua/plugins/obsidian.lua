return {
  "epwalsh/obsidian.nvim",
  event = { "BufReadPre *.md", "BufNewFile *.md" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = vim.fn.expand("~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/"),
      },
    },
    preferred_link_style = "wiki",
    notes_subdir = "01 - Inbox",
    new_notes_location = "notes_subdir",

    daily_notes = {
      folder = "02- Daily",
      date_format = "%d-%m-%Y",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily" },
      template = "Daily Template",
    },
    templates = {
      folder = "Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
      substitutions = {
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        ["date:YYYY-MM-DD"] = function()
          return os.date("%Y-%m-%d")
        end,
      },
    },
    attachments = {
      img_folder = "attachments",
    },
    completion = {
      nvim_cmp = false,
    },
    ui = {
      enable = false
    },
    picker = {
      name = "telescope.nvim",
    },
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
    },
  },
  keys = {
    { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Obsidian Template" },
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian New Note" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Obsidian Open" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian Search" },
    { "<leader>oD", "<cmd>ObsidianDailies<cr>", desc = "Obsidian Dailies" },
    {
      "<leader>od",
      function()
        vim.api.nvim_put({ os.date("%Y-%m-%d") }, "c", true, true)
      end,
      desc = "Insert Date",
    },
  },
}
