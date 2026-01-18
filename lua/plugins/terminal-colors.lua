-- terminal-colors.lua: Terminal transparency settings for Ghostty
-- Ghostty Theme: Broadcast (bg: #2b2b2b, fg: #e6e1dc)
-- Font: Fira Code 14pt
--
-- This plugin ensures transparency is applied after colorscheme loading
-- by using vim.schedule and multiple autocmds (VimEnter, ColorScheme)

return {
  {
    -- Virtual plugin for transparency configuration
    "folke/lazy.nvim", -- Use lazy itself as a dummy dependency
    lazy = false,
    priority = 1, -- Load after colorschemes (which have priority 1000)
    config = function()
      -- Function to apply transparency settings
      local function apply_transparency()
        local hl = vim.api.nvim_set_hl

        -- Core transparent backgrounds
        hl(0, "Normal", { bg = "NONE" })
        hl(0, "NormalNC", { bg = "NONE" }) -- Non-current windows
        hl(0, "NormalFloat", { bg = "NONE" })
        hl(0, "FloatBorder", { bg = "NONE" })
        hl(0, "FloatTitle", { bg = "NONE" })

        -- Sign column and line numbers
        hl(0, "SignColumn", { bg = "NONE" })
        hl(0, "LineNr", { bg = "NONE" })
        hl(0, "CursorLineNr", { bg = "NONE" })
        hl(0, "FoldColumn", { bg = "NONE" })

        -- Status line
        hl(0, "StatusLine", { bg = "NONE" })
        hl(0, "StatusLineNC", { bg = "NONE" })

        -- Tab line
        hl(0, "TabLine", { bg = "NONE" })
        hl(0, "TabLineFill", { bg = "NONE" })
        hl(0, "TabLineSel", { bg = "NONE" })

        -- Popup menu
        hl(0, "Pmenu", { bg = "NONE" })
        hl(0, "PmenuSbar", { bg = "NONE" })
        hl(0, "PmenuThumb", { bg = "NONE" })

        -- End of buffer (~ characters)
        hl(0, "EndOfBuffer", { bg = "NONE" })

        -- Vertical split line
        hl(0, "VertSplit", { bg = "NONE" })
        hl(0, "WinSeparator", { bg = "NONE" })

        -- Tree/File explorer backgrounds (for nvim-tree, neo-tree, etc.)
        hl(0, "NvimTreeNormal", { bg = "NONE" })
        hl(0, "NvimTreeNormalNC", { bg = "NONE" })
        hl(0, "NeoTreeNormal", { bg = "NONE" })
        hl(0, "NeoTreeNormalNC", { bg = "NONE" })
        hl(0, "NeoTreeEndOfBuffer", { bg = "NONE" })

        -- Telescope
        hl(0, "TelescopeNormal", { bg = "NONE" })
        hl(0, "TelescopeBorder", { bg = "NONE" })
        hl(0, "TelescopePromptNormal", { bg = "NONE" })
        hl(0, "TelescopeResultsNormal", { bg = "NONE" })
        hl(0, "TelescopePreviewNormal", { bg = "NONE" })

        -- Which-key
        hl(0, "WhichKeyFloat", { bg = "NONE" })

        -- Snacks.nvim dashboard
        hl(0, "SnacksDashboardNormal", { bg = "NONE" })

        -- Lazy.nvim
        hl(0, "LazyNormal", { bg = "NONE" })

        -- Noice
        hl(0, "NoiceCmdlinePopup", { bg = "NONE" })
        hl(0, "NoiceCmdlinePopupBorder", { bg = "NONE" })
        hl(0, "NoicePopup", { bg = "NONE" })
        hl(0, "NoicePopupBorder", { bg = "NONE" })

        -- Mason
        hl(0, "MasonNormal", { bg = "NONE" })

        -- Notify
        hl(0, "NotifyBackground", { bg = "NONE" })
      end

      -- Apply on startup with schedule to ensure after colorscheme
      vim.schedule(apply_transparency)

      -- Apply after VimEnter for extra safety
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("TransparencyOnEnter", { clear = true }),
        callback = function()
          vim.schedule(apply_transparency)
        end,
        desc = "Apply transparency after VimEnter",
      })

      -- Apply after any colorscheme change
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("TransparencySettings", { clear = true }),
        pattern = "*",
        callback = apply_transparency,
        desc = "Reapply transparency after colorscheme change",
      })
    end,
  },
}
