local Color, colors, Group, _, _ = require('colorbuddy').setup {}

require("noirbuddy").setup({
	colors = {
		background = "#131313",
		primary = "#19d420",
		secondary = "#FFFFFF",
		noir_1 = "#FFFF00",
		noir_2 = "#ffffff",
		noir_3 = "#FFFFFF",
	}
})

local folder_color = "#FFFF00"

local custom_colors = {
	NvimTreeWinSeparator = { fg = "#666666" },
	NvimTreeRootFolder = { fg = "#000000", bg = "#FFFFFF"},
	NvimTreeFolderName = { fg = folder_color },
	NvimTreeOpenedFolderName = { fg = folder_color },
	NvimTreeImageFile = { fg = "#EE4455" },
	CursorLine = { bg = "#222222", fg = "#FFFFFF" },
	MatchParen = { bg = "#131313", fg = "#FF00FF" },
	PmenuSel = { bg = "#505050", fg = "#FFFFFF" },
	Pmenu = { bg = "#303030", fg = "#888888" },
	StatusLine = { bg = "#FFFFFF", fg = "#000000" },
	StatusLineNC = { bg = "#505050", fg = "#000000" },
	LineNr = { fg = "#505050" },
	["@keyword"] = { fg = "#FFFF00" },
	["@method"] = { fg = "#FFFF00" },
	["@repeat"] = { fg = "#FFFF00" },
	["@conditional"] = { fg = "#FFFF00" },
	["@constant"] = { fg = "#0080ff" },
	["@punctuation"] = { fg = "#0080ff" },
	["@function.builtin"] = { fg = "#0080ff" },
	["@include"] = { fg = "#FFFF00" },
}

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
