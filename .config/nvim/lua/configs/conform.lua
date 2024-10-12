local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "black" },
    javascript = { "prettier" },
  },
  lsp_fallback = true,
  format_on_save = {
    -- These options will be passed to conform.format()
    enabled = true,
    timeout_ms = 1000,
  },
}

return options
