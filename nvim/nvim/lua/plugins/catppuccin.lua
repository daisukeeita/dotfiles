return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {},
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true, -- disables setting the background color.
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        integrations = {
          cmp = true,
          dashboard = true,
          grug_far = true,
          gitsigns = true,
          headlines = true,
          illuminate = true,
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          mini = {
            enabled = true,
            indentscope_color = "lavender",
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
              ok = { "italic" },
            },
            underlines = {
              errors = false,
              hints = false,
              warnings = false,
              information = false,
            },
            inlay_hints = {
              background = true,
            },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telekasten = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      })

      vim.cmd([[colorscheme catppuccin-mocha]])
      vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#796465" })
    end,
  },
}
