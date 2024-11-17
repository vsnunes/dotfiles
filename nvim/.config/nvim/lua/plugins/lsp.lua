return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      bashls = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh" },
        root_dir = require("lspconfig.util").find_git_ancestor,
        single_file_support = true,
        settings = {
          bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command)",
          },
        },
      },
      pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              kubernetes = "globPattern",
            },
          },
        },
      },
    },
  },
}
