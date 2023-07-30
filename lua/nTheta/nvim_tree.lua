local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

nvim_tree.setup()
nvim_tree.setup({
	sync_root_with_cwd = true,
	renderer = {
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			git_placement = "before",
			modified_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = false,
				modified = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				modified = "●",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		debounce_delay = 50,
		severity = {
			min = vim.diagnostic.severity.ERROR,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = "H",
			info = "I",
			warning = "W",
			error = "E",
		},
	},
	filters = {
		dotfiles = true,
		git_clean = false,
		no_buffer = false,
		custom = {},
		exclude = {},
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		timeout = 400,
	},
	modified = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
})

local function open_nvim_tree(dir)
	if not dir then
		return
	end

	api.tree.open({path = dir})
end

vim.keymap.set("n", "<C-E>", api.tree.toggle)

vim.keymap.set("n", "<C-o>", function ()
	vim.ui.input({prompt = "> "}, function (input)
		if input == nil then
			return
		end
		api.tree.close()
		open_nvim_tree(input)
	end)
end)

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=#181819 guifg=#9da5b3")

