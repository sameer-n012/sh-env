return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local todo_comments = require("todo-comments")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })

		config_opts = {

			-- default keywords with some removed
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = " ", color = "hint" },
				-- HACK = { icon = " ", color = "warning" },
				-- WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				-- PERF = { icon = " ", color = "hint", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "info", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "warning", alt = { "TESTING", "PASSED", "FAILED" } },
				-- QUES = { icon = "? ", color = "info", alt = { "QUESTION", "HELP" } }
			},

			merge_keywords = false,

			highlight = {
				-- pattern = [[.*<(KEYWORDS)\s*:]],
				pattern = [[.*<(KEYWORDS)\s*]],
			},

			-- default search except no ':' needed after keyword
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				-- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
				pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			},
		}

		todo_comments.setup(config_opts)
	end,
}
