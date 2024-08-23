return {
  "lukas-reineke/indent-blankline.nvim",
  opts = function(_, opts)
    local highlight = {
      "RainbowRed",
      "RainbowOrange",
      "RainbowYellow",
      "RainbowGreen",
      "RainbowCyan",
      "RainbowBlue",
      "RainbowViolet",
    }
    local hooks = require "ibl.hooks"
    local colors = require("base46").get_theme_tb "base_30"

    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = colors.red })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = colors.orange })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = colors.yellow })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = colors.green })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = colors.cyan })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = colors.blue })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = colors.purple })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    opts.indent = {
      char = "┆",
      tab_char = "┆",
    }

    opts.scope = {
      char = "▏",
      highlight = highlight,
    }
  end,
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
}
