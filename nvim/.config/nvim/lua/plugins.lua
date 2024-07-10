local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('preservim/nerdtree')
Plug('airblade/vim-gitgutter')
Plug('tpope/vim-surround')
Plug('valloric/youcompleteme')

vim.call('plug#end')
