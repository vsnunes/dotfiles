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
        { name = "nvim_lsp", keyword_length = 1, priority = 10 }, -- from language server
        { name = "crates", keyword_length = 1, priority = 10 },
        { name = "luasnip", keyword_length = 1, priority = 7 }, -- for lua users
        { name = "path" }, -- file paths
        { name = "nvim_lsp_signature_help", priority = 8 }, -- display function signatures with current parameter emphasized
        { name = "nvim_lua", keyword_length = 1, priority = 8 }, -- complete neovim's Lua runtime API such vim.lsp.*
        { name = "buffer", keyword_length = 1, priority = 5 }, -- source current buffer
        { name = "calc" }, -- source for math calculation
      }
    end,
  },
  {
    {
      "echasnovski/mini.surround",
      keys = function(_, keys)
        -- Populate the keys based on the user's options
        local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
        local opts = require("lazy.core.plugin").values(plugin, "opts", false)
        local mappings = {
          { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
          { opts.mappings.delete, desc = "Delete surrounding" },
          { opts.mappings.find, desc = "Find right surrounding" },
          { opts.mappings.find_left, desc = "Find left surrounding" },
          { opts.mappings.highlight, desc = "Highlight surrounding" },
          { opts.mappings.replace, desc = "Replace surrounding" },
          { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
        }
        mappings = vim.tbl_filter(function(m)
          return m[1] and #m[1] > 0
        end, mappings)
        return vim.list_extend(mappings, keys)
      end,
      opts = {
        mappings = {
          add = "gsa", -- Add surrounding in Normal and Visual modes
          delete = "gsd", -- Delete surrounding
          find = "gsf", -- Find surrounding (to the right)
          find_left = "gsF", -- Find surrounding (to the left)
          highlight = "gsh", -- Highlight surrounding
          replace = "gsr", -- Replace surrounding
          update_n_lines = "gsn", -- Update `n_lines`
        },
      },
    },
  },
}
