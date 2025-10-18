return {
  "stevearc/conform.nvim",
  event = "BufWritePost", -- format on save
  opts = {
    formatters_by_ft = {
      bash = { "beautysh" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      latex = { "latexindent" },
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "black" },
      sh = { "beautysh" },
      toml = { "taplo" },
      xml = { "xmlformatter" },
      yaml = { "prettier" },
      zsh = { "beautysh" },
    },
    lsp_fallback = true,
    format_on_save = {
      -- These options will be passed to conform.format()
      enabled = true,
      timeout_ms = 50000,
    },
  },
}

-- TODO: keybind for formatting. Formatting on save not ideal.
