return {
  "stevearc/conform.nvim",
  -- event = { "BufEnter" }, -- format on save
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      bash = { "beautysh" },
      css = { "prettier" },
      html = { "prettier" },
      java = { "clang-format" },
      javascript = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      tex = {"latexindent"},
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "black" },
      sh = { "beautysh" },
      toml = { "taplo" },
      xml = { "xmlformatter" },
      yaml = { "prettier" },
      zsh = { "beautysh" },
    },
    format_on_save = {
      enabled = false,
    },
  },
}
