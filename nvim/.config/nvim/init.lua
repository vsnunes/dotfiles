
-- Disable compatibility with old vi
vim.opt.compatible = false

-- Convert tabs to spaces, should be default
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 4

-- Copy indentation from previous line
vim.opt.autoindent = true

-- Show line numbers
vim.opt.number = true

-- Completion mode: Complete longest common string, then list alternatives
vim.opt.wildmode = "longest,list"

-- Code rulers
vim.opt.cc = "120"

-- Speed up scrolling
vim.opt.ttyfast = true

-- Define map leader as SPACE
vim.g.mapleader = " "

-- Avoid breaking a line in a middle of a word
vim.opt.linebreak = true

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- KEYMAPS
-- Buffer navigation
vim.keymap.set("n", "<Leader>h", "<cmd>:bprevious<CR>")
vim.keymap.set("n", "<Leader>l", "<cmd>:bnext<CR>")


-- Toggle file explorer
vim.keymap.set("n", "<Leader>e", "<cmd>NERDTreeToggle<CR>")

local opts = { noremap = true, silent = true }

-- Navigate to diagnostic
vim.keymap.set("n", "<C-n>", function()
        vim.diagnostic.goto_next()
end, opts)
vim.keymap.set("n", "<C-m>", function()
        vim.diagnostic.goto_prev()
end, opts)
vim.keymap.set("n", "<C-,>", function()
        vim.diagnostic.open_float()
end, opts)

require('plugins')
