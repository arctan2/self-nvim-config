local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', function ()
	builtin.buffers({ sort_mru = true })
end, {})

local function trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end

vim.keymap.set('n', '<leader>ps', function ()
	local inp = vim.fn.input("Grep > ")
	if trim(inp) == "" then
		return
	end
	builtin.grep_string({ search = inp })
end)

vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})

require('telescope').setup{
	defaults = {
		mappings = {
			n = {
				['<c-d>'] = require('telescope.actions').delete_buffer
			}, -- n
 			i = {
				["<C-h>"] = "which_key",
				['<c-d>'] = require('telescope.actions').delete_buffer
			}
		}
	}
}
