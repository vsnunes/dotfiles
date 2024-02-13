local keymap = vim.keymap

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')
