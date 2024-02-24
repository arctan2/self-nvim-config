require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"c",
		"rust",
		"go",
		"javascript",
		"typescript",
		"lua",
		"vim",
		"query",
		"python",
		"css",
		"html",
		"tsx",
		"vue",
		"asm"
	},

	sync_install = false,

	auto_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
