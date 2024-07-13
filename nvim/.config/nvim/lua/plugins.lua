local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('preservim/nerdtree')
Plug('airblade/vim-gitgutter')
Plug('tpope/vim-surround')
Plug('valloric/youcompleteme')
Plug('sheerun/vim-polyglot')

vim.call('plug#end')
