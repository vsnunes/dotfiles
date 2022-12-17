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
set cc=80
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

" ======================== Plugins ========================
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'voldikss/vim-floaterm'
    Plug 'kdheepak/lazygit.nvim'
    Plug 'airblade/vim-gitgutter'
    Plug 'ervandew/supertab'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-surround'
    Plug 'valloric/youcompleteme', { 'do': './install.py' }
    Plug 'dense-analysis/ale'
    Plug 'scrooloose/nerdcommenter'
    Plug 'junegunn/vim-easy-align'
call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Theme settings
set background=light
colorscheme PaperColor

" ======================== Custom plugins configuration ========================
let g:airline_theme                           = 'cool'
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter    = 'unique_tail'

" Open ALE suggestions as floating windows
let g:ale_floating_preview           = 1
let g:ale_hover_to_floating_preview  = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_floating_window_border     = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

" Change floaterm default background
hi Floaterm guibg=black
hi FloatermBorder guibg=orange guifg=cyan
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_kill   = '<F10>'
let g:floaterm_keymap_toggle = '<F2>'
let g:floaterm_title         = '$1/$2'

" NERDTree
nnoremap <silent> <Space> :NERDTreeToggle<CR>

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Windows and Linux Keybinds
nnoremap <A-z> :bp<CR>
nnoremap <A-x> :bn<CR>
nnoremap <A-c> :bd<CR>
nnoremap <A-f> :Fd<CR>
nnoremap <A-r> :Rg<CR>
nnoremap <A-b> :Buffers<CR>
nnoremap <A-g> :LazyGit<CR>
nnoremap <A-d> :GitGutterDiffOrig<CR>
nnoremap <A-t> :FloatermToggle<CR>
nnoremap <A-s> :setlocal spelllang=en_us spell!<CR>
nnoremap <A-n> :setlocal relativenumber! number<CR>
nnoremap <A-e> :ALEDetail<CR>
nmap <A-t> <F2>

" MacOS Keybinds
nnoremap Ω :bp<CR>
nnoremap « :bn<CR>
nnoremap © :bd<CR>
nnoremap ƒ :Fd<CR>
nnoremap ® :Rg<CR>
nnoremap ∫ :Buffers<CR>
nnoremap ˙ :LazyGit<CR>
nnoremap ∂ :GitGutterDiffOrig<CR>
nnoremap ™ :FloatermToggle<CR>
nnoremap ß :setlocal spelllang=en_us spell!<CR>
nnoremap ¬ :setlocal relativenumber! number<CR>
nnoremap æ :ALEDetail<CR>

" Use fzf for spell checking suggestions
nnoremap z= :call FzfSpell()<CR>

" Allow exit terminal mode using ESC-ESC
tnoremap <Esc><Esc> <C-\><C-n>

" ======================== Commands ========================
command! Fd call fzf#run(fzf#wrap({'source': 'fd --follow --type f --hidden --exclude .git',
            \ 'options': "--preview='less {}'"}))

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

command! -bang -nargs=? Buffers
            \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline','--tiebreak=end']}), <bang>0)

" ======================== Functions ========================
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run(fzf#wrap({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 }))
endfunction

