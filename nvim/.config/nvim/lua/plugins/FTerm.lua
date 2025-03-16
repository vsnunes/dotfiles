local fterm = require('FTerm')
vim.keymap.set('n', '<C-y>', function () fterm.toggle() end, { silent = true})
vim.keymap.set('t', '<C-y>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
