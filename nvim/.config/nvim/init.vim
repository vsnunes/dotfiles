" ======================== General settings ========================
" Disable compatibility with old vim
set nocompatible

" Jump to the closing bracket
set showmatch

" Convert tabs to spaces
set expandtab

" Number of spaces for auto indent
set shiftwidth=4

" Copy identation from previous line
set autoindent

" Round ident to multiples of shiftwidth when indenting
set shiftround

" Insert spaces when pressing tab
set smarttab

" Number of spaces that a tab in the file counts for
set tabstop=4

" Get bash-like tab completions
set wildmode=longest,list

" Show line numbers
set number

" Set rulers for good coding style
set cc=120
hi ColorColumn guibg=#2d2d2d ctermbg=246

" Allow auto-indenting depending on file type
filetype plugin indent on

" Enables syntax highlighting
syntax on

" Enable mouse click
set mouse=a

" Speed up scrolling in Vim
set ttyfast

" Define the leader key
let mapleader="\\"

" Highlight all search matches
set hlsearch

" Avoid wrapping a line in the middle of a word
set linebreak

" Set window title
set title

" Imports
runtime ./plug.vim

" ======================== Buffers ========================
nnoremap <C-A> :vertical resize -1<CR>
nnoremap <C-S> :vertical resize +1<CR>

" Keybindings
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    let theme = system("defaults read -g AppleInterfaceStyle")
    if theme != "Dark\n"
      set background=light
    endif

      runtime ./macos.vim
  else
    runtime ./unix.vim
  endif
endif

colorscheme PaperColor

" Use fzf for spell checking suggestions
nnoremap z= :call FzfSpell()<CR>

" ======================== Terminal ========================
tnoremap <Esc><Esc> <C-\><C-n>

" ======================== Commands ========================
runtime ./commands.vim

" ======================== Functions ========================
runtime ./functions.vim
