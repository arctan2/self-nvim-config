local lsp = require('lsp-zero').preset({
  name = 'minimal',
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
	set_lsp_keymaps = {
		omit = { "<C-K>" }
	}
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({ virtual_text = true })

local cmp = require('cmp')

---cmp.setup({
	---completion = {
		--autocomplete = true
	--}
--})
