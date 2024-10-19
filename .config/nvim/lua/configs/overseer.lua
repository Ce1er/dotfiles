return {
  "stevearc/overseer.nvim",
  requires = "akinsho/toggleterm.nvim",
  cmd = { "OverseerRun", "OverseerToggle" },
  config = function()
    local overseer = require "overseer"

    overseer.setup {
      strategy = {
        "toggleterm",
        open_on_start = true,
      },
    }

    overseer.register_template {
      name = "Run Python file",
      builder = function()
        return {
          cmd = "python3",
          args = { vim.fn.expand "%" }, -- Current file
          components = { "default" },
        }
      end,
    }
  end,
}
