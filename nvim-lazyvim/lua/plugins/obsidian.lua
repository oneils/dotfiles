return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    legacy_commands = true,
    workspaces = {
      {
        name = "notes",
        path = vim.fn.expand("~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/"),
      },
    },
    preferred_link_style = "wiki",
    notes_subdir = "01 - Inbox",
    new_notes_location = "notes_subdir",

    note_id_func = function(title)
      if title ~= nil then
        return title
      else
        local date = os.date("%Y%m%d")
        local random = math.random(1000, 9999)
        return date .. "-" .. random
      end
    end,

    daily_notes = {
      folder = "02- Daily",
      date_format = "%d-%m-%Y",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily" },
      template = "Daily Template",
    },
    weekly_notes = {
      folder = "03 - Weekly",
      date_format = "%Y-W%W",
      alias_format = "Week %W, %Y",
      default_tags = { "weekly" },
      template = "Weekly Template",
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
        ["date:YYYY-MM"] = function()
          return os.date("%Y-%m")
        end,
        ["date:YYYY"] = function()
          return os.date("%Y")
        end
      },
    },
    attachments = {
      img_folder = "_attachments",
    },
    completion = {
      nvim_cmp = false,
    },
    ui = {
      enable = false,
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
    { "<leader>on", "<cmd>ObsidianNew<cr>",      desc = "Obsidian New Note" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>",     desc = "Obsidian Open" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>",   desc = "Obsidian Search" },
    { "<leader>oD", "<cmd>ObsidianDailies<cr>",  desc = "Obsidian Dailies" },
    {
      "<leader>ow",
      function()
        local obsidian = require("obsidian")
        local client = obsidian.get_client()
        -- Calculate ISO week number (W01-W53 format)
        local function get_iso_week()
          local year = tonumber(os.date("%Y"))
          local day_of_year = tonumber(os.date("%j"))
          local jan1_weekday = tonumber(os.date("%w", os.time({ year = year, month = 1, day = 1 })))

          -- Adjust for Sunday = 0 to Monday = 1 system
          if jan1_weekday == 0 then
            jan1_weekday = 7
          end

          local week = math.floor((day_of_year + jan1_weekday - 2) / 7) + 1

          if week < 1 then
            week = 52 -- Previous year's last week
            year = year - 1
          elseif week > 52 then
            local next_jan1_weekday = tonumber(os.date("%w", os.time({ year = year + 1, month = 1, day = 1 })))
            if next_jan1_weekday == 0 then
              next_jan1_weekday = 7
            end
            if next_jan1_weekday <= 4 then
              week = 1
              year = year + 1
            end
          end

          return string.format("%d-W%02d", year, week)
        end

        local week_year = get_iso_week()
        local weekly_folder = "03 - Weekly"
        local note_name = week_year .. ".md"
        local note_path = client.dir:joinpath(weekly_folder, note_name)

        -- Create weekly folder if it doesn't exist
        local weekly_dir = client.dir:joinpath(weekly_folder)
        if not weekly_dir:is_dir() then
          weekly_dir:mkdir({ parents = true })
        end

        -- Check if note exists, if not create from template
        if not note_path:is_file() then
          local template_path = client.dir:joinpath("Templates", "Weekly Template.md")
          local content = ""

          if template_path:is_file() then
            content = template_path:read_text()
          else
            -- Default content if no template
            content =
                string.format("# Week %s, %s\n\n## Goals\n\n## Completed\n\n## Notes\n\n", os.date("%W"), os.date("%Y"))
          end

          -- Write the file
          local file = io.open(tostring(note_path), "w")
          if file then
            file:write(content)
            file:close()
          end
        end

        -- Open the note
        vim.cmd("edit " .. tostring(note_path))
      end,
      desc = "Obsidian Weekly",
    },
    { "<leader>op", "<cmd>ObsidianPasteImg<cr>",   desc = "Paste Image" },
    { "<leader>of", "<cmd>ObsidianFollowLink<cr>", desc = "Follow Link" },
    {
      "<leader>od",
      function()
        vim.api.nvim_put({ os.date("%Y-%m-%d") }, "c", true, true)
      end,
      desc = "Insert Date",
    },
  },
}
