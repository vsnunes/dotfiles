local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- ToggleTerm
keymap.set("n", "<Leader>t", "<cmd>ToggleTerm size=50 direction=vertical<CR>")
keymap.set("n", "<Leader>ts", "<cmd>ToggleTerm direction=horizontal<CR>")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "<C-k>", function()
  vim.diagnostic.goto_prev()
end, opts)
