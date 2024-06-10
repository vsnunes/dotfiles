-- nvim-cmp configs
return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      }
      opts.window = {
        completion = { cmp.config.window.bordered(), col_offset = 3, side_padding = 1 },
        documentation = cmp.config.window.bordered(),
      }

      opts.mapping = {
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }

      opts.sources = {
        { name = "path" }, -- file paths
        { name = "nvim_lsp", keyword_length = 1, priority = 10 }, -- from language server
        { name = "crates", keyword_length = 1, priority = 10 },
        { name = "luasnip", keyword_length = 1, priority = 7 }, -- for lua users
        { name = "nvim_lsp_signature_help", priority = 8 }, -- display function signatures with current parameter emphasized
        { name = "nvim_lua", keyword_length = 1, priority = 8 }, -- complete neovim's Lua runtime API such vim.lsp.*
        { name = "buffer", keyword_length = 1, priority = 5 }, -- source current buffer
        { name = "calc" }, -- source for math calculation
      }
    end,
  },
}
