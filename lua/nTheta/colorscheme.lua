local Color, colors, Group, _, _ = require('colorbuddy').setup {}

require("noirbuddy").setup({
	colors = {
		background = "#131313",
		primary = "#19D420",
		secondary = "#FFFFFF",
		noir_2 = "#FFFFFF",
		noir_3 = "#FFFFFF",
		noir_4 = "#FFFFFF",
		noir_5 = "#FFFFFF",
		noir_6 = "#FFFFFF",
		noir_7 = "#AAAAAA",
	}
})

local folder_color = "#FFFF00"

local custom_colors = {
	-- NvimTreeWinSeparator = { fg = "#666666" },
	-- NvimTreeRootFolder = { fg = "#000000", bg = "#FFFFFF"},
	OilDir = { fg = folder_color },
	-- NvimTreeOpenedFolderName = { fg = folder_color },
	-- NvimTreeImageFile = { fg = "#EE4455" },
	-- NvimTreeIndentMarker = { fg = "#777777" },
	-- NvimTreeNormal = { fg = "#BBBBBB" },

	LineNr = { fg = "#505050" },
	CursorLine = { bg = "#404040", fg = "#FFFFFF" },
	CursorLineNr = { fg = "#DDDDDD" },
	MatchParen = { bg = "#505050", fg = "#FFFF00" },
	PmenuSel = { bg = "#505050", fg = "#FFFFFF" },
	Pmenu = { bg = "#303030", fg = "#888888" },
	StatusLine = { bg = "#FFFFFF", fg = "#000000" },
	StatusLineNC = { bg = "#606060", fg = "#000000" },
	ErrorMsg = { fg = "#ff3b3b", bg = "#131313" },
	MoreMsg = { fg = "#000000", bg = "#FFFFFF" },

	Visual = { bg = "#555555" },

	["@keyword"] = { fg = "#FFFF00" },
	["@keyword.return"] = { fg = "#FFFF00" },
	["@keyword.function"] = { fg = "#FFFF00" },
	["@keyword.operator"] = { fg = "#FFFF00" },
	["@type.qualifier"] = { fg = "#FFFF00" },
	["@constructor"] = { fg = "#FFFF00" },
	["@repeat"] = { fg = "#FFFF00" },
	["@conditional"] = { fg = "#FFFF00" },
	["@include"] = { fg = "#FFFF00" },
	["@type.builtin"] = { fg = "#AAAAAA" },
	["@preproc"] = { fg = "#FFFF00" },
	["@comment"] = { fg = "#d68829" },
	["@type.css"] = { fg = "#FFFF00" },
	["@tag"] = { fg = "#AAAAAA" },
	["@constant"] = { fg = "#0080ff" },
	["@punctuation"] = { fg = "#0080ff" },
	["@function.builtin"] = { fg = "#0080ff" },
	["@variable.builtin"] = { fg = "#AAAAAA" },
	["@constant.builtin"] = { fg = "#AAAAAA" },
	["@exception"] = { fg = "#FFFF00" },
}

vim.highlight.priorities.semantic_tokens = 95

for k, v in pairs(custom_colors) do
	local k_fg = k.."Fg"
	local k_bg = k.."Bg"

	if v.fg ~= nil then
		Color.new(k_fg, v.fg)
	end
	if v.bg ~= nil then
		Color.new(k_bg, v.bg)
	end
	Group.new(k, colors[k_fg] or colors.none, colors[k_bg] or colors.none)
end
