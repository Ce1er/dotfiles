return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "css",
      "html",
      "javascript",
      "lua",
      "luadoc",
      "markdown_inline",
      "printf",
      "python",
      "vim",
      "vimdoc",
      "xml",
    },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
  },
}
