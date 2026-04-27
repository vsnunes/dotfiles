return {
  "folke/tokyonight.nvim",
  opts = {
    colorscheme = function()
      require("tokyonight").load()
    end,
  },
}
