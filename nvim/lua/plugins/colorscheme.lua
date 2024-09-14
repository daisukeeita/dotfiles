return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = auto,
				background = {
					light = latte,
					dark = mocha,
				},
				transparent_background = true,
				term_colors = true,
				style = {
					conditionals = { "italic" },
					variables = { "italic" },
					functions = { "bold", "italic" },
				},
				integrations = {
					alpha = true,
					notify = true,
					mason = true,
					noice = true,
					neotree = true,
					cmp = true,
					dashboard = true,
					treesitter = true,
					gitsigns = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")
			vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#796465" })
		end,
	},
}
