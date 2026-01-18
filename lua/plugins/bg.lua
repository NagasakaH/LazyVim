-- bg.nvim: Automatically sync terminal background and cursor color with Neovim colorscheme
-- Uses OSC escape sequences to update terminal colors
return {
  {
    "typicode/bg.nvim",
    lazy = false, -- Must load immediately at startup
  },
}
