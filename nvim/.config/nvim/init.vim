filetype plugin indent on

set nocompatible

set nu

set shiftwidth=4 smarttab
set expandtab

set colorcolumn=80

set background=dark
hi Normal guibg=NONE ctermbg=NONE

call plug#begin()
    Plug 'preservim/nerdtree'
call plug#end()

nnoremap <space>e :NERDTreeToggle<CR>
