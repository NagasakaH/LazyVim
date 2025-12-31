return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    name = "easy-dotnet",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("easy-dotnet").setup({
        use_roslyn_lsp = true,
      })
    end,
    ft = { "cs", "fsharp" },
  },
}
