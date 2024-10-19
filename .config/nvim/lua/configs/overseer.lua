local function get_shebang()
  local file = io.open(vim.fn.expand "%:p", "r")
  if file then
    local first_line = file:read "*l"
    file:close()
    if first_line and first_line:sub(1, 2) == "#!" then
      return first_line:sub(3) -- Return interpreter part of the shebang
    end
  end
  return nil
end

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
      name = "Run",
      builder = function()
        local filename = vim.fn.expand "%:p" -- Get the full path to the current file

        local shebang = get_shebang()

        -- Work out command to use
        local run_command
        if shebang then
          run_command = { shebang, filename }
        else
          -- Fallback to filetype-based check
          local filetype = vim.bo.filetype
          if filetype == "python" then
            run_command = { "python", filename }
          elseif filetype == "javascript" then
            run_command = { "node", filename }
          elseif filetype == "sh" then
            run_command = { "bash", filename }
          elseif filetype == "lua" then
            run_command = { "lua", filename }
          else
            run_command = { "echo", "No run command for filetype: " .. filetype }
          end
        end

        return {
          name = "Run " .. vim.fn.expand "$:t",
          cmd = run_command,
          components = { "default" },
        }
      end,
    }
  end,
}
