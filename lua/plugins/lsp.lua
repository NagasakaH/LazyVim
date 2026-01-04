return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
          cmd_env = {
            DOTNET_ROLL_FORWARD = "Major",
            DOTNET_ROOT = "/usr/share/dotnet",
          },
          enable_editorconfig_support = true,
          enable_ms_build_load_projects_on_demand = false,
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
      },
      setup = {
        -- Completely disable easy_dotnet LSP
        easy_dotnet = function()
          return true -- return true to skip setup
        end,
      },
    },
  },
}
