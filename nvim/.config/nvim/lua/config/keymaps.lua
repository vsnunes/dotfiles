local keymap = vim.keymap
local builtin = require("telescope.builtin")

local opts = { noremap = true, silent = true }

keymap.set("n", "s", "cl")

-- Telescope
vim.keymap.set("n", "<leader>fv", builtin.live_grep, { desc = "Live grep" })

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- ToggleTerm
keymap.set("n", "<Leader>t", "<cmd>ToggleTerm size=50 direction=vertical<CR>")
keymap.set("n", "<Leader>ts", "<cmd>ToggleTerm direction=horizontal<CR>")

-- Diagnostics
keymap.set("n", "<C-n>", function()
  vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "<C-m>", function()
  vim.diagnostic.goto_prev()
end, opts)
