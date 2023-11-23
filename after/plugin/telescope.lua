local builtin = require('telescope.builtin')

require('telescope').setup{
	defaults = {
		mappings = {
			n = {
				['<c-d>'] = require('telescope.actions').delete_buffer
			},
 			i = {
				["<C-h>"] = "which_key",
				['<c-d>'] = require('telescope.actions').delete_buffer
			}
		}
	}
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', function ()
	builtin.buffers({ sort_mru = true })
end, {})
vim.keymap.set('n', '<leader>ma', builtin.marks, {})

vim.keymap.set('n', '<leader>ml', function()
	builtin.marks({ mark_type = "local" })
end, {})
vim.keymap.set('n', '<leader>mg', function()
	builtin.marks({ mark_type = "global" })
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

