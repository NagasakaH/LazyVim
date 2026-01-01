return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    name = "easy-dotnet",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dotnet_cmd = vim.fn.executable("dotnet") == 1 and "dotnet" or "/usr/bin/dotnet"

      require("easy-dotnet").setup({
        use_roslyn_lsp = true,
        dotnet_cli_path = dotnet_cmd,
        -- Enable debugging with netcoredbg
        dap = {
          enabled = true,
        },
      })

      -- Setup nvim-dap for .NET debugging
      local dap = require("dap")

      -- Configure netcoredbg adapter
      dap.adapters.coreclr = {
        type = "executable",
        command = "/usr/local/bin/netcoredbg",
        args = { "--interpreter=vscode" },
      }

      -- Configure .NET debug configurations
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
      }
    end,
    ft = { "cs", "fsharp" },
  },
}
