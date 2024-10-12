require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- DAP
local dap = require "dap"
local dapui = require "dapui"

map("n", "<F5>", dap.continue, { noremap = true, silent = true, desc = "Start Debugging" })
map("n", "<F10>", dap.step_over, { noremap = true, silent = true, desc = "Step Over" })
map("n", "<F11>", dap.step_into, { noremap = true, silent = true, desc = "Step Into" })
map("n", "<F12>", dap.step_out, { noremap = true, silent = true, desc = "Step Out" })
map("n", "<Leader>B", dap.toggle_breakpoint, { noremap = true, silent = true, desc = "Toggle Breakpoint" })
map("n", "<Leader>u", dapui.toggle, { noremap = true, silent = true, desc = "Toggle DAP UI" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
