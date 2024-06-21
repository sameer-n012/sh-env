return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			-- from https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
			ensure_installed = {
				"bashls",
				"clangd",
				"cmake",
				"cssls",
				"eslint",
				"emmet_ls",
				"html",
				-- "hls",
				"jsonls",
				"jdtls",
				"tsserver",
				"ltex",
				"lua_ls",
				"autotools_ls",
				"markdown_oxide",
				"matlab_ls",
				"pyright",
				"rust_analyzer",
				"sqlls",
				"lemminx",
				"yamlls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"black", -- python formatter
				"pylint",
				-- "ast_grep",
				"eslint_d",
				"clang-format", -- java/c/c++/js/json formatter
				"rustfmt",
			},
		})
	end,
}
