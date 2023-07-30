local nvim_tree_api = require("nvim-tree.api")

vim.api.nvim_create_user_command("NvimConfig", function ()
	local config_path = vim.fn.stdpath('config')
	vim.api.nvim_set_current_dir(config_path)
	nvim_tree_api.tree.open(config_path)
end, {})
