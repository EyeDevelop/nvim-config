local chatgpt = require('chatgpt')
chatgpt.setup({
    keymaps = {
        submit = '<C-s>'
    }
})

-- Set keybinds
vim.keymap.set('n', '<leader>gc', vim.cmd.ChatGPT, {})
