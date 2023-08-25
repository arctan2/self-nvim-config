require('catppuccin').setup{
	color_overrides = {
		all = {
			base = "#050505",
			mantle = "#090909",
		}
	},
	highlight_overrides = {
		all = function(colors)
			return {
				NvimTreeNormal = { bg = colors.none },
				NvimTreeWinSeparator = { fg = "#555577" },
				NvimTreeRootFolder = { fg = "#000000", bg = "#FFFFFF" },
				NvimTreeImageFile = { fg = "#EE4455" },
			}
		end
	}
}

vim.cmd("colorscheme catppuccin")
