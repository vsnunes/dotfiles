local lualine = require('lualine')

local mode = {
    'mode',
    fmt = function(str)
        -- prevents mode from pushing remaining sections to the right whenever
        -- I turn COMMAND mode on
        return string.format('%-7s', str)
    end
}

local diff = {
    'diff',
    colored = true,
    symbols = {
        added    = ' ',
        modified = ' ',
        removed  = ' ',
    }
}

local diagnostics = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error', 'warn', 'info', 'hint'},
    colored = true,
    update_in_insert = false,
}

lualine.setup({
    options = {
        theme = 'OceanicNext',
        section_separators = { left = '', right = '' },
    },

    sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { diagnostics, 'filename' },
        lualine_x = { diff, 'fileformat', 'filetype' },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
    },
})
