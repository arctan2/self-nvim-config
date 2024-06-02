require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"c",
		"rust",
		"go",
		"javascript",
		"typescript",
		"lua",
		"vim",
		"vimdoc",
		"python",
		"css",
		"html",
		"tsx",
		"query",
		"vue",
	},

	sync_install = false,

	auto_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
