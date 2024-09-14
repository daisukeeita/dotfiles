return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		dependencies = { "mason.nvim" },
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					javscriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
				},
				format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
				format_after_save = { "fallback" },
			})
		end,
	},

	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better deal with markdown code blocks
			markdown = true,
		},
		config = function()
			require("mini.pairs").setup()
		end,
	},

	{
		"echasnovski/mini.indentscope",
		opts = {
			symbol = "╏",
		},
	},
}
