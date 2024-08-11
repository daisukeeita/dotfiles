return {
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },

  {
    'nvim-lua/plenary.nvim',
    lazy = true
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        fps = 60,
        stages = "fade",
        render = "compact",
      })
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        presets = {
          bottom_search = false,
          command_palette = true,
        },
        views = {
          cmdline_popup = {
            position = {
              row = 53.5,
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = 50,
              col = "50%",
            },
            size = {
              width = 50,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 1, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
        },
      })
    end,
  },

  {
    "echasnovski/mini.indentscope",
    event = "BufReadPost",
    version = false,
    opts = {
      symbol = "╎",
    },
  },
}
