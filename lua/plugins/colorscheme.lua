-- colorscheme.lua: Tokyo Night colorscheme with native transparency support
-- Native transparent option ensures proper transparency at colorscheme level

return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
