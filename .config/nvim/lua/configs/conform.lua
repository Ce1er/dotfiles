local options = {
  formatters_by_ft = {
    bash = { "beautysh" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    json = { "prettier" },
    latex = { "latexindent" },
    lua = { "stylua" },
    markdown = { "prettier" },
    python = { "black" },
    sh = { "beautysh" },
    xml = { "xmllint" },
    yaml = { "prettier" },
    zsh = { "beautysh" },
  },
  lsp_fallback = true,
  format_on_save = {
    -- These options will be passed to conform.format()
    enabled = true,
    timeout_ms = 5000,
  },
}

return options
