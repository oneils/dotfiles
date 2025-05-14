return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you use the mini.nvim suite
    lazy = false,
    config = function()
      require("render-markdown").setup({
        render_modes = { "n", "c", "t" },
      })
    end,
  },
}
