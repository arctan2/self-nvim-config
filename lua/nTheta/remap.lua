local utils = require("nTheta.utils")

-- removing these things
vim.keymap.set("v", "K", function() end)
vim.keymap.set("n", "<PageDown>", function() end)
vim.keymap.set("n", "<PageUp>", function() end)
vim.keymap.set("i", "<PageDown>", function() end)
vim.keymap.set("i", "<PageUp>", function() end)

-- buffer navigation
vim.keymap.set("n", "<leader>bp", vim.cmd.bp)
vim.keymap.set("n", "<leader>bn", vim.cmd.bn)

vim.keymap.set("n", "<C-w>n", vim.cmd.new)
vim.keymap.set("n", "<C-w>v", vim.cmd.vnew)

-- open new split terminal
vim.keymap.set("n", "<leader>tv", ":vnew | terminal<CR>")
vim.keymap.set("n", "<leader>th", ":new | terminal<CR>")

-- window navigation
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- cycle windows
vim.keymap.set("n", "<C-L>", "<C-w>w")
vim.keymap.set("n", "<C-H>", "<C-w>W")

-- terminal mapping
local t_normal = "<C-\\><C-n>"

vim.keymap.set("t", "<C-n>", t_normal)
vim.keymap.set("t", "<C-t>", t_normal..":wincmd p<CR>")

-- terminal mode window navigation
vim.keymap.set("t", "<C-l>", t_normal.."<C-w>l")
vim.keymap.set("t", "<C-h>", t_normal.."<C-w>h")
vim.keymap.set("t", "<C-j>", t_normal.."<C-w>j")
vim.keymap.set("t", "<C-k>", t_normal.."<C-w>k")

vim.keymap.set("t", "<C-L>", t_normal.."<C-w>w")
vim.keymap.set("t", "<C-H>", t_normal.."<C-w>W")

-- window resize horizontal
vim.keymap.set("n", "<leader>+", "<C-w>+")
vim.keymap.set("n", "<leader>-", "<C-w>-")

vim.keymap.set("n", "<C-s>", function()
	local height = vim.fn.winheight(0)
	if height == 1 then
		vim.cmd.resize(100)
	else
		vim.cmd.resize(1)
	end
end)

-- window resize vertical
vim.keymap.set("n", "<leader><tab>", "<C-w>>")
vim.keymap.set("n", "<leader><BS>", "<C-w><")

-- moving the visual-line blocks up and down
vim.keymap.set("v", "<c-k>", function ()
	local to = vim.fn.getcurpos()[2]
	local from = vim.fn.getpos("v")[2]
	local cmd = math.min(from, to)..","..math.max(from, to).."m"..(math.min(from, to) - 2)..";"..tostring(to)

	vim.cmd(cmd)

	utils.visual_select(from - 1, to - 1)
end)

vim.keymap.set("v", "<c-j>", function ()
	local from = vim.fn.getpos("v")[2]
	local to = vim.fn.getcurpos()[2]

	local cmd = math.min(from, to)..","..math.max(from, to).."m"..(math.max(from, to) + 1)..";"..tostring(to)

	vim.cmd(cmd)

	utils.visual_select(from + 1, to + 1)
end)
