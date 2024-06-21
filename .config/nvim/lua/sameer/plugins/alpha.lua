return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local function footer()
			local time = os.date("  %Y-%m-%d %H:%M:%S ")

			local v = vim.version()
			local version = "  v" .. v.major .. "." .. v.minor .. "." .. v.patch

			return time .. version
		end

		-- Set header
		dashboard.section.header.val = {
			"                                                ",
			"                                          _.oo. ",
			"                  _.u[[/;:,.         .odMMMMMM' ",
			"               .o888UU[[[/;:-.  .o@P^    MMM^   ",
			"              oN88888UU[[[/;::-.        dP^     ",
			"             dNMMNN888UU[[[/;:--.   .o@P^       ",
			"            ,MMMMMMN888UU[[/;::-. o@^           ",
			"            NNMMMNN888UU[[[/~.o@P^              ",
			"            888888888UU[[[/o@^-..               ",
			"           oI8888UU[[[/o@P^:--..                ",
			"        .@^  YUU[[[/o@^;::---..                 ",
			"      oMP     ^/o@P^;:::---..                   ",
			"   .dMMM    .o@^ ^;::---...                     ",
			"  dMMMMMMM@^`       `^^^^                       ",
			" YMMMUP^                                        ",
			"  ^^                                            ",
			"                                                ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("SPC  n", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  > Open Explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "  > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰁯  > Restore Session", "<cmd>SessionRestore<CR>"),
			dashboard.button(
				"SPC  s",
				"  > Open Settings",
				":e $MYVIMRC | :cd %:p:h | :split . | :wincmd w | :pwd<CR>"
			),
			dashboard.button("SPC  q", "  > Quit", "<cmd>qa<CR>"),
		}

		-- TODO: fix alpha footer
		dashboard.section.footer = {
			{
				type = "text",
				val = footer(),
				opts = {
					position = "center",
					hl = "Constant",
				},
			},
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
