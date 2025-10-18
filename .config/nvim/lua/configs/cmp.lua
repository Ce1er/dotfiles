return {
  "Saghen/blink.cmp",
  version = "v0.*",
  -- !Important! Make sure you're using the latest release of LuaSnip
  -- `main` does not work at the moment
  dependencies = {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = "rafamadriz/friendly-snippets",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()

      history = true
      updateevents = "TextChanged,TextChangedI"
    end,
  },
  opts = {
    snippets = {
      preset = "luasnip",
      -- expand = function(snippet)
      --   require("luasnip").lsp_expand(snippet)
      -- end,
      -- active = function(filter)
      --   if filter and filter.direction then
      --     return require("luasnip").jumpable(filter.direction)
      --   end
      --   return require("luasnip").in_snippet()
      -- end,
      -- jump = function(direction)
      --   require("luasnip").jump(direction)
      -- end,
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    signature = { enabled = true }, -- I don't think this is working at all. But it shows in the documentation.
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = "none",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" }, -- TODO: make default
      ["<C-e>"] = { "hide" },
      ["<C-y>"] = { "select_and_accept" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-n>"] = { "select_next", "fallback_to_mappings" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },

      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },

      completion = {
        documentation = {
          auto_show = true, -- auto show does not work. Just use <C-space> with menu open for now.
          auto_show_delay_ms = 500,
        },
        ghost_text = {
          enabled = true,
        },
      },
    },
  },
}
