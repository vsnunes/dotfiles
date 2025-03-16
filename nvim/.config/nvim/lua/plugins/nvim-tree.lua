require('nvim-tree').setup({
    renderer = {
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = true,
                git = true
            },
        },
    },
    view = {
        side = "right",
        width = 25
    },
})
