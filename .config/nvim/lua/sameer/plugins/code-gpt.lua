return {
	"dpayne/CodeGPT.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},

	-- vim.g["codegpt_global_commands_defaults"] = {
	--     -- model = "gpt-3.5-turbo", -- default
	-- },

	config = function()
		require("codegpt.config")
	end,
}
