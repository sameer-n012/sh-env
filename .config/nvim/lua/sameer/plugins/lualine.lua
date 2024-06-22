return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local CodeGPTModule = require("codegpt")
		-- local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- bright colors
		-- local colors = {
		--   blue = "#65D1FF",
		--   green = "#3EFFDC",
		--   violet = "#FF61EF",
		--   yellow = "#FFDA7B",
		--   red = "#FF4A4A",
		--   fg = "#c3ccdc",
		--   bg = "#112638",
		--   inactive_bg = "#2c3043",
		-- }

		-- catppuccin-mocha colors
		local colors = {
			blue = "#74c7ec",
			green = "#a6e3a1",
			violet = "#cba6f7",
			yellow = "#f9e2af",
			red = "#eba0ac",
			fg = "#cdd6f4",
			bg = "#1e1e2e",
			inactive_bg = "#313244",
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = my_lualine_theme,
			},
			sections = {
				lualine_x = {
					-- {
					--   lazy_status.updates,
					--   cond = lazy_status.has_updates,
					--   color = { fg = "#ff9e64" },
					-- },
					CodeGPTModule.get_status,
					"filetype",
					"encoding",
					-- { "fileformat" },
				},
			},
		})
	end,
}
