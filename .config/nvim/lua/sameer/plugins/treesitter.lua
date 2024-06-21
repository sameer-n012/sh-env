return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },

			-- enable autotagging (w/ nvim-ts-autotag plugin)
			-- autotag = {
			--     enable = true,
			-- },
			-- ensure these language parsers are installed
			ensure_installed = {
				"bash",
				"c",
				"cmake",
				-- "cpp",
				"css",
				"csv",
				"dockerfile",
				"gitignore",
				-- "go",
				-- "haskell",
				"html",
				"java",
				"javascript",
				"json",
				-- "json5",
				-- "kotlin",
				"latex",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				-- "matlab",
				"python",
				-- "r",
				"rust",
				"sql",
				-- "typescript",
				-- "tsx",
				"xml",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
