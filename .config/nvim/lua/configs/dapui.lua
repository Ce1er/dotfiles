return {
  "rcarriga/nvim-dap-ui",
  requires = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    -- Setup DAP UI
    dapui.setup {
      -- Set icons for the UI elements
      icons = { expanded = "▾", collapsed = "▸", current_frame = "●" },

      -- Customize the layout
      layout = {
        {
          elements = {
            { id = "scopes", size = 0.25 }, -- Scope inspector
            { id = "breakpoints", size = 0.25 }, -- Breakpoints panel
            { id = "stacks", size = 0.25 }, -- Call stack panel
            { id = "watches", size = 0.25 }, -- Watches panel
          },
          size = 40, -- Total size of the UI panel
          position = "left", -- Position of the panel
        },
        {
          elements = {
            { id = "repl", size = 0.5 }, -- REPL panel
            { id = "console", size = 0.5 }, -- Console panel
          },
          size = 10, -- Total size of the REPL console
          position = "bottom", -- Position of the REPL console
        },
      },

      -- Customize the floating window options
      floating = {
        border = "rounded", -- Set border style
        mappings = {
          close = { "q", "<Esc>" }, -- Keybindings to close the floating window
        },
      },

      -- Customize the controls
      controls = {
        enabled = true,
        element = "repl", -- The control panel can be linked to the REPL
        icons = {
          pause = "⏸️",
          play = "▶️",
          step_into = "🔍",
          step_over = "➡️",
          step_out = "⬅️",
          run_last = "▶️",
          terminate = "🛑",
        },
      },
    }

    -- Automatically open DAP UI when debugging starts
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    -- Close DAP UI when debugging ends
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    -- Close DAP UI when the debugging session is exited
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    local map = vim.keymap.set
    map("n", "<Leader>u", dapui.toggle, { noremap = true, silent = true, desc = "Toggle DAP UI" })
  end,
}
