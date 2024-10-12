local dap = require "dap"

dap.adapters.python = {
  type = "server",
  host = "127.0.0.1",
  port = 5678,
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
  {
    type = "python",
    request = "attach",
    name = "Attach to Python",
    connect = {
      host = "127.0.0.1",
      port = 5678,
    },
    mode = "client",
    justMyCode = false,
  },
}
