-- add yours here
require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<F6>", ":DapContinue<CR>", { noremap = true, silent = true, desc = "Start Debugging" })
map("n", "<F10>", ":DapStepOver<CR>", { noremap = true, silent = true, desc = "Step Over" })
map("n", "<F11>", ":DapStepInto<CR>", { noremap = true, silent = true, desc = "Step Into" })
map("n", "<F12>", ":DapStepOut<CR>", { noremap = true, silent = true, desc = "Step Out" })
map("n", "<Leader>B", ":DapToggleBreakpoint<CR>", { noremap = true, silent = true, desc = "Toggle Breakpoint" })
-- map("n", "<Leader>u", dapui.toggle, { noremap = true, silent = true, desc = "Toggle DAP UI" }) set in configs/dapui.lua
map("n", "<Leader>R", ":OverseerRun<CR>", { silent = true })
map("n", "<F5>", ":OverseerRun Run<CR>", { silent = true })

map({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
map({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
map({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")

map("n", "<Tab>", function()
  require("tabtree").next()
end)

map("n", "<S-Tab>", function()
  require("tabtree").previous()
end)

map("n", "<leader>tu", "<cmd>UndotreeToggle<CR>")

map("n", "<C-a>", function()
  require("dial.map").manipulate("increment", "normal")
end)
map("n", "<C-x>", function()
  require("dial.map").manipulate("decrement", "normal")
end)
map("n", "g<C-a>", function()
  require("dial.map").manipulate("increment", "gnormal")
end)
map("n", "g<C-x>", function()
  require("dial.map").manipulate("decrement", "gnormal")
end)
map("v", "<C-a>", function()
  require("dial.map").manipulate("increment", "visual")
end)
map("v", "<C-x>", function()
  require("dial.map").manipulate("decrement", "visual")
end)
map("v", "g<C-a>", function()
  require("dial.map").manipulate("increment", "gvisual")
end)
map("v", "g<C-x>", function()
  require("dial.map").manipulate("decrement", "gvisual")
end)

map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords
--
-- map("n", "]t", function()
--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
-- end, { desc = "Next error/warning todo comment" })
