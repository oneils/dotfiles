return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "gopls",
        "marksman",
        "markdownlint",
        "html-lsp",
        "htmx-lsp",
        "lua-language-server",
        "css-lsp",
        "prettier",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_installation = true,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "go",
        "java",
        "http",
        "gomod",
      },
    },
  },
}
