local builtin = require('telescope.builtin')

local actions = require('telescope.actions')

local function delete_buf(bufnr)
	actions.delete_buffer(bufnr)
end

require('telescope').setup {
	defaults = {
		mappings = {
			n = {
				['<c-d>'] = delete_buf
			},
			i = {
				["<C-h>"] = "which_key",
				['<c-d>'] = delete_buf
			}
		}
	}
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', function()
	builtin.buffers({ sort_mru = true })
end, {})

vim.keymap.set('n', '<leader>ma', builtin.marks, {})

vim.keymap.set('n', '<leader>ml', function()
	builtin.marks({ mark_type = "local" })
end, {})

vim.keymap.set('n', '<leader>mg', function()
	builtin.marks({ mark_type = "global" })
end, {})

vim.keymap.set('n', '<leader>qf', function ()
	vim.diagnostic.setqflist({
		open = false,
		title = "Errors",
		severity = vim.diagnostic.severity.ERROR
	})

	builtin.quickfix({
		trim_text = true,
		show_line = true,
		nr = 0
	})
end)

vim.keymap.set('n', '<leader>qw', function ()
	vim.diagnostic.setqflist({
		open = false,
		title = "Warnings",
		severity = vim.diagnostic.severity.WARN
	})

	builtin.quickfix({
		trim_text = true,
		show_line = true,
		nr = 0
	})
end)

local function trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end

vim.keymap.set('n', '<leader>ps', function()
	local inp = vim.fn.input("Grep > ")
	if trim(inp) == "" then
		return
	end
	builtin.grep_string({ search = inp })
end)

vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
