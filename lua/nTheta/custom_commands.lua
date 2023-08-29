local nvim_tree_api = require("nvim-tree.api")

local commands = {
	NvimConfig = function ()
		local config_path = vim.fn.stdpath('config')
		vim.api.nvim_set_current_dir(config_path)
		nvim_tree_api.tree.open(config_path)
	end
}

for c, fn in pairs(commands) do
	vim.api.nvim_create_user_command(c, fn, {})
end
