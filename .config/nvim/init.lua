vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

require "configs.lazy"

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- TODO: remove base46 stuff

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
