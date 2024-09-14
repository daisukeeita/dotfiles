local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr })
		end
	end,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = { checkThirdParty = false },
			diagnostics = { globals = { "vim" } },
			completion = {
				callSnippet = "Both",
				keywordSnippet = "Both",
				workspaceWord = true,
			},
			hint = {
				enable = true,
				paramType = false,
				semicolon = false,
				setType = true,
				arrayIndex = false,
			},
		},
	},
})

require("lspconfig").eslint.setup({
	capabilities = capabilities,
	settings = {
		packageManager = "npm",
	},
})

require("lspconfig").ts_ls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr })
		end
	end,
	single_file_support = false,
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "literal",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
	init_options = {
		hostInfo = "neovim",
	},
})

require("lspconfig").tailwindcss.setup({})
