vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit colour
vim.opt.termguicolors = true

-- Editor style
require('editor')

-- Plugins
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-telescope/telescope.nvim', { tag = '0.1.8' }) -- for searching
Plug('nvim-lua/plenary.nvim')
Plug('nvim-treesitter/nvim-treesitter') -- improved highlighting
Plug('nvim-tree/nvim-tree.lua') -- file explorer
Plug('nvim-lualine/lualine.nvim') -- status line
Plug('windwp/nvim-autopairs') -- autopairs for brackets
Plug('numToStr/Comment.nvim') -- for comments
Plug('kylechui/nvim-surround') -- surround selections
Plug('mfussenegger/nvim-lint') -- linting
Plug('lewis6991/gitsigns.nvim') -- gitsigns
Plug('numToStr/FTerm.nvim') -- floating terminal
Plug('neovim/nvim-lspconfig') -- lsp configs

-- snippets
Plug('L3MON4D3/LuaSnip')
Plug('rafamadriz/friendly-snippets')

-- autocomplete
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('saadparwaiz1/cmp_luasnip')

-- themes
Plug('catppuccin/nvim', {as = 'catppuccin'})

vim.call('plug#end')

vim.cmd.colorscheme "catppuccin"

-- Keybind mappings
require('mappings')

require('lsp')

-- Plugins
require('plugins.nvim-tree')
require('plugins.treesitter')
require('plugins.lualine')
require('plugins.nvim-autopairs')
require('plugins.Comment')
require('plugins.nvim-surround')
require('plugins.nvim-lint')
require('plugins.nvim-cmp')
require('plugins.gitsigns')
require('plugins.FTerm')

