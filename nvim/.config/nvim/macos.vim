" MacOS Keybinds
nnoremap Ω :bp<CR>
nnoremap « :bn<CR>
nnoremap © :bd<CR>
nnoremap å :%bd!\|e#<CR>
nnoremap ƒ :Fd<CR>
nnoremap ∑ :Find<CR>
nnoremap ® :Rg<CR>
nnoremap ∫ :Buffers<CR>
nnoremap ˙ :LazyGit<CR>
nnoremap ∂ :GitGutterDiffOrig<CR>
nnoremap ™ :FloatermToggle<CR>
nnoremap ß :setlocal spelllang=en_us spell!<CR>
nnoremap ¬ :setlocal relativenumber! number<CR>
nnoremap æ :ALEDetail<CR>

" ======================== Editor ==========================
" Quote current word
nmap œ ysiw"

" Quote current line
nmap √ cst"

nmap † ysiw]

" Use OSX clipboard to copy and to paste
set clipboard+=unnamedplus

" Terminal
tnoremap ™ <C-\><C-n>:FloatermToggle<CR>
tnoremap √ <C-\><C-n>:FloatermUpdate --wintype=vsplit<CR>
tnoremap ƒ <C-\><C-n>:FloatermUpdate --wintype=float<CR>

