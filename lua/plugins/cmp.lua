return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- Set the <CR> mapping to nil to remove it
      opts.mapping["<CR>"] = nil
    end,
  },
}
