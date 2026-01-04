-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false

-- Add treesitter parser directory to runtimepath
local parser_dir = vim.fn.stdpath("data") .. "/site"
vim.opt.runtimepath:prepend(parser_dir)

--- Add command to restart treesitter
vim.api.nvim_create_user_command('TSRestart', function()
  vim.treesitter.stop()
  vim.treesitter.start()
end, {})

-- Add dotnet tools to PATH for nvim
local home = vim.fn.expand("$HOME")
local dotnet_tools = home .. "/.dotnet/tools"
vim.env.PATH = dotnet_tools .. ":" .. vim.env.PATH

-- Configure .NET SDK resolution
vim.env.DOTNET_ROOT = "/usr/share/dotnet"
vim.env.DOTNET_MULTILEVEL_LOOKUP = "0"
vim.env.DOTNET_ROLL_FORWARD = "Major"

-- OSC 52 clipboard support for DevContainer/WSL2
-- Using vim.g.clipboard instead of external clipboard provider
local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}

-- Enable termguicolors for better OSC 52 support
vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"
vim.opt.shell = '/bin/bash'
