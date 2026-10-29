return {
  "mfussenegger/nvim-dap",
  requires = {
    "rcarriga/nvim-dap-ui",
  },
  cmd = { "DapContinue", "DapStepOver", "DapStepInto", "DapStepOut", "DapToggleBreakpoint" },
  config = function()
    local dap = require "dap"

    dap.adapters.python = {
      type = "executable",
      command = "debugpy-adapter",
      args = {},
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch Current file",
        program = "${file}",
        -- console = "integratedTerminal",
        -- justMyCode = false,
        pythonPath = function()
          return "/usr/bin/python"
        end,
      },
    }
  end,
}
