-- adds ussage of Telescope file browser
return {
  "nvim-telescope/telescope-file-browser.nvim",
  keys = {
    {
      "<leader>sB",
      ":Telescope file_browser path=%:p:h=%:p:h<cr>",
      desc = "BRowse Files",
    },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
