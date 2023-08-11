" Windows and Linux Keybinds
nnoremap <A-z> :bp<CR>
nnoremap <A-x> :bn<CR>
nnoremap <A-c> :bd<CR>
nnoremap <A-a> :%bd!\|e#<CR>
nnoremap <A-f> :Fd<CR>
nnoremap <A-w> :Find<CR>
nnoremap <A-r> :Rg<CR>
nnoremap <A-b> :Buffers<CR>
nnoremap <A-g> :LazyGit<CR>
nnoremap <A-d> :GitGutterDiffOrig<CR>
nnoremap <A-t> :FloatermToggle<CR>
nnoremap <A-s> :setlocal spelllang=en_us spell!<CR>
nnoremap <A-n> :setlocal relativenumber! number<CR>
nnoremap <A-e> :ALEDetail<CR>
nmap <A-t> <F2>

" ======================== Editor ==========================
" Quote current word
nmap <A-q> ysiw"

" Quote current line
nmap <A-v> cst"

nmap <A-u> ysiw]

tnoremap <C-w> <C-\><C-n><C-w><CR>
tnoremap <A-t> <C-\><C-n>:FloatermToggle<CR>
tnoremap <A-v> <C-\><C-n>:FloatermUpdate --wintype=vsplit<CR>
tnoremap <A-f> <C-\><C-n>:FloatermUpdate --wintype=float<CR>
command! -nargs=* R :FloatermSend <args>

