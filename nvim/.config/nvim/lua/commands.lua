 -- List of useful commands when handling with certain files

-- Formats the current file according to its type
function fmt(filename)
    -- assume current file if no file is provided
    if filename == '' then
        filename = '%'
    end
    filetype = vim.filetype.match({ filename = vim.fn.expand(filename) })
    if filetype == 'tf' then
        vim.cmd(string.format('silent !tofu fmt %s', filename))
    elseif filetype == 'hcl' then
        vim.cmd(string.format('silent !terragrunt hcl fmt %s', filename))
    end
end

vim.api.nvim_create_user_command('Fmt', function(opts)
    fmt(opts.args)
end, { desc = 'Format file', nargs = '?', complete = 'file' })

