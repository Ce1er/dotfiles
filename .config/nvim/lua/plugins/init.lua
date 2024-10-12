return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-telescope/telescope-dap.nvim",
  },

  {
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "configs.dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "configs.dapui"
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    requires = "mfussenegger/nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },

  {
    "nvim-neotest/nvim-nio",
    config = function() end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
      },
    },
  },
  {
    "stevearc/overseer.nvim",
    requires = "akinsho/toggleterm.nvim",
    config = function()
      require("configs.overseer").setup()
    end,
    lazy = true,
    cmd = { "OverseerRun", "OverseerToggle" },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
    end,
  },
  -- {
  --   "CRAG666/code_runner.nvim",
  --   requires = { "nvim-lua/plenary.nvim", "CRAG666/betterTerm.nvim" },
  --   config = function()
  --     require("configs.code_runner").setup()
  --   end,
  -- },
  -- {
  --   "CRAG666/betterTerm.nvim",
  --   config = function()
  --     require("configs.betterterm").setup()
  --   end,
  -- },
  -- {
  --   "nvim-lua/plenary.nvim",
  -- },
}
