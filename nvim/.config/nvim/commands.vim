command! Fd call fzf#run(fzf#wrap({'source': 'fd --follow --type f --hidden --exclude .git',
            \ 'options': "--preview='bat --color=always --style=numbers --line-range=:500 {}'"}))

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

command! -bang -nargs=? Buffers
            \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline','--tiebreak=end']}), <bang>0)
