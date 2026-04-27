return {
  "folke/tokyonight.nvim",
  opts = {
    colorscheme = function()
      require("tokyonight").load()
    end,
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
