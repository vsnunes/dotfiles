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
    Plug 'tpope/vim-repeat'
    Plug 'valloric/youcompleteme', { 'do': './install.py' }
    Plug 'dense-analysis/ale'
    Plug 'scrooloose/nerdcommenter'
    Plug 'junegunn/vim-easy-align'
    Plug 'sheerun/vim-polyglot'
call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ======================== Custom plugins configuration ========================
let g:airline_theme                           = 'murmur'
let g:airline_powerline_fonts                 = 1
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter    = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

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

