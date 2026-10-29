vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, {
  performance = {
    rtp = {
      paths = { "/usr/share/vim/vimfiles" },
    },
  },
  lazy_config,
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"
require "options"

vim.schedule(function()
  require "mappings"
end)

-- autocmds

-- clear search highlight when entering insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.hlsearch = false
  end,
})

vim.api.nvim_create_autocmd({ "LspAttach" }, {
  pattern = "*",
  callback = function()
    vim.lsp.inlay_hint.enable(true)
  end,
})

-- LSP
local servers = {
  "ast-grep",
  "clangd",
  "css-lsp",
  "cssls",
  "html-lsp",
  "jdtls",
  "lemminx",
  "lua-language-server",
  "pyright",
  "ruff",
  "stylua",
  "taplo",
  "texlab",
  "textlsp",
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
  vim.lsp.config(lsp, {})
end
