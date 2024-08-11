local icons = require("utils.icons").icons
local opt = vim.opt

opt.autoread = true
opt.breakindent = true
opt.cursorline = true
opt.expandtab = true
opt.ignorecase = true
opt.linebreak = true
opt.list = true
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.showmode = false
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.title = true
opt.wrap = false

opt.laststatus = 3
opt.numberwidth = 3
opt.scrolloff = 8
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.textwidth = 78

opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noinsert,noselect"
--opt.colorcolumn = '+1'
opt.encoding = "utf-8"
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
opt.omnifunc = "v:lua.vim.lsp.omnifunc"
--opt.fileencoding = 'utf-8'
--opt.showbreak = '» '
--opt.spelloptions = 'camel'

vim.notify = require("notify")

vim.diagnostic.config({
  float = {
    border = "single",
    focusable = true,
    style = "minimal",
    source = "if_many",
    header = "",
    prefix = "  ",
  },
  virtual_text = {
    enable = true,
    prefix = "󱅶 ",
    suffix = icons.ui.arrow_left,
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.ui.lsp_error,
      [vim.diagnostic.severity.WARN] = icons.ui.lsp_warn,
      [vim.diagnostic.severity.INFO] = icons.ui.lsp_info,
      [vim.diagnostic.severity.HINT] = icons.ui.lsp_hint,
    },
    linehl = {
      --[vim.diagnostic.severity.ERROR] = "DiagnosticError",
      --[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
      --[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
      --[vim.diagnostic.severity.HINT] = "DiagnosticHint",
    },
  },
})
