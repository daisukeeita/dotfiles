return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
    config = function () require("mason").setup() end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
}
