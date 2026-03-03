return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config

  opts = {
    keymap = {
      preset = 'default',
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "select_and_accept", "fallback" },
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
      keyword = { range = "full" },
      list = { selection = { preselect = true, auto_insert = true } },
      menu = {
        auto_show = true,
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                return kind_icon
              end,
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                return hl
              end,
            },
            kind = {
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                return hl
              end,
            }
          },
          columns = {
            { "label",     "label_description", gap = 1 },
            { "kind_icon", "kind",              gap = 1 },
          },
        },
      },
      documentation = { auto_show = false },
      ghosttext = { enabled = false },
    },

    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'buffer',
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
-- return { -- Autocompletion
--   "saghen/blink.cmp",
--   event = "VimEnter",
--   version = "1.*",
--   dependencies = {
--     {
--       "rafamadriz/friendly-snippets",
--     },
--     {
--       "L3MON4D3/LuaSnip",
--       version = "2.*",
--       build = (function()
--         if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
--           return
--         end
--         return "make install_jsregexp"
--       end)(),
--       dependencies = {
--         {
--           'rafamadriz/friendly-snippets',
--           config = function()
--             require('luasnip.loaders.from_vscode').lazy_load()
--           end,
--         },
--       },
--       opts = {},
--     },
--     "folke/lazydev.nvim",
--   },
--   --- @module 'blink.cmp'
--   --- @type blink.cmp.Config
--   opts = {
--     keymap = {
--       preset = "default",
--
--       ["<Up>"] = { "select_prev", "fallback" },
--       ["<Down>"] = { "select_next", "fallback" },
--
--       ["<C-k>"] = { "select_prev", "fallback" },
--       ["<C-j>"] = { "select_next", "fallback" },
--
--       ["<Tab>"] = { "select_and_accept", "fallback" },
--     },
--
--     appearance = {
--       nerd_font_variant = "mono",
--     },
--
--     completion = {
--       keyword = { range = "full" },
--       list = { selection = { preselect = true, auto_insert = true } },
--       menu = {
--         auto_show = true,
--         draw = {
--           columns = {
--             { "label",     "label_description", gap = 1 },
--             { "kind_icon", "kind" },
--           },
--         },
--       },
--
--       documentation = { auto_show = false, auto_show_delay_ms = 500 },
--       ghost_text = { enabled = false },
--     },
--
--     sources = {
--       default = { "lsp", "path", "snippets", "lazydev" },
--       providers = {
--         lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
--         lsp = {
--           opts = {},
--
--           enabled = true,
--           async = false,
--
--           timeout_ms = 2000,
--
--           transform_items = nil,
--
--           should_show_items = true,
--           max_items = nil,
--           min_keyword_length = 0,
--
--           fallbacks = {},
--           score_offset = 0,
--           override = nil,
--         },
--       },
--     },
--
--     snippets = { preset = "luasnip" },
--     fuzzy = { implementation = "prefer_rust_with_warning" },
--     signature = { enabled = true },
--   },
--   opts_extend = { "sources.default" },
-- }
