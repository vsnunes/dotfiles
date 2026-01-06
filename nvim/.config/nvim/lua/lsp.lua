vim.lsp.config("lua_ls", {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            diagnostics = {
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.config("bashls", {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'bash', 'sh' }
})

vim.lsp.enable 'lua_ls'
vim.lsp.enable 'bashls'
