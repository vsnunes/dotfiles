local lualine = require('lualine')

local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

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
        theme = bubble_theme,
        section_separators = { left = '', right = '' },
    },

    sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { diagnostics, 'filename' },
        lualine_x = { diff, 'fileformat', 'filetype' },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
    },
})
