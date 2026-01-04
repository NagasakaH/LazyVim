return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Set parser install directory
      local parser_dir = vim.fn.stdpath("data") .. "/site"
      opts.parser_install_dir = parser_dir

      -- Add to runtimepath
      vim.opt.runtimepath:prepend(parser_dir)

      -- Ensure C# parser is installed
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "c_sharp" })

      -- Force enable highlighting
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true

      return opts
    end,
  },
}
