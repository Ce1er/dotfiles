-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<F5>", ":DapContinue<CR>", { noremap = true, silent = true, desc = "Start Debugging" })
map("n", "<F10>", ":DapStepOver<CR>", { noremap = true, silent = true, desc = "Step Over" })
map("n", "<F11>", ":DapStepInto<CR>", { noremap = true, silent = true, desc = "Step Into" })
map("n", "<F12>", ":DapStepOut<CR>", { noremap = true, silent = true, desc = "Step Out" })
map("n", "<Leader>B", ":DapToggleBreakpoint<CR>", { noremap = true, silent = true, desc = "Toggle Breakpoint" })
-- map("n", "<Leader>u", dapui.toggle, { noremap = true, silent = true, desc = "Toggle DAP UI" }) set in configs/dapui.lua
map("n", "<Leader>R", ":OverseerRun<CR>", { silent = true })
