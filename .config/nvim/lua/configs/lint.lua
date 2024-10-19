return {
  "mfussenegger/nvim-lint",
  ft = "python", -- Load only with python files
  config = function()
    require("lint").linters_by_ft = {
      python = { "mypy" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
