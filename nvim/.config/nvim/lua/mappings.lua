-- keybind mappings
-- Plugin specific mappings are on the lua/plugins/pluginname.lua files

local function map(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end


vim.g.mapleader = ' ' -- Space key is the mapleader

-- buffers
map('n', '<S-h>', ':bnext<CR>')
map('n', '<S-l>', ':bprevious<CR>')
map('n', '<leader>sv', ':vsplit<CR>:bnext<CR>')
map('n', '<leader>sh', ':split<CR>:bnext<CR>')

-- common cmds
map('n', '<leader>z', function()
    vim.wo.wrap = not vim.wo.wrap
end)

map('n', '<leader>e', function()
    require('nvim-tree.api').tree.toggle()
end)

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>fw', function()
    telescope.grep_string({search = vim.fn.expand("<cword>")})
end, { desc = 'Telescope grep current word' })

vim.keymap.set('n', '<leader>fe', function()
    telescope.grep_string({search = vim.fn.expand("<cWORD>")})
end, { desc = 'Telescope grep current expression' })

-- diagnostics
vim.keymap.set('n', '<C-n>', function()
    vim.diagnostic.jump({count = 1, float = true})
end)
vim.keymap.set('n', '<C-p>', function()
    vim.diagnostic.jump({count = -1, float = true})
end)
vim.keymap.set('n', '<C-m>', function()
    vim.diagnostic.open_float()
end)

