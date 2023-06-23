local builtin = require('telescope.builtin')
local lsp = require('lsp-zero')

lsp.preset("recommended")

-- Autocomppletion settings
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

-- Keymap settings
lsp.on_attach(function(_client, buf_nr)
	local opts = { buffer = buf_nr, remap = false }
	vim.keymap.set({ 'n', 'x' }, '<leader>cf', function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end)
	vim.keymap.set('n', '<leader>cd', function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set('n', '<leader><leader>', function() vim.diagnostic.open_float() end, opts)
	-- vim.keymap.set('n', '<leader>cr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>cr', builtin.lsp_references, opts)
	vim.keymap.set('n', '<leader>cR', function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set({ 'n', 'i' }, '<C-p>', function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
end)

lsp.setup()
