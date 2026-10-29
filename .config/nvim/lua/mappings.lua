-- vim:foldmethod=marker:
require "nvchad.mappings"

local map = vim.keymap.set

map("i", "<C-BS>", "<C-W>")

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

map("n", "<leader>F", function()
  require("conform").format()
end)

-- You can also specify a list of valid jump keywords
--
-- map("n", "]t", function()
--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
-- end, { desc = "Next error/warning todo comment" })


Snacks = require("snacks")

-- Snacks {{{
map("n", "<leader>e", function()
  Snacks.explorer()
end, {
  desc = "File Explorer",
})

map("n", "<leader><space>", function()
  Snacks.picker.smart()
end, {
  desc = "",
})

map("n", "<leader>,", function()
  Snacks.picker.buffers()
end, {
  desc = "Buffers",
})

map("n", "<leader>gr", function()
  Snacks.picker.grep()
end, {
  desc = "Grep",
})

map("n", "<leader>:", function()
  Snacks.picker.command_history()
end, {
  desc = "Command History",
})

map("n", "<leader>n", function()
  Snacks.picker.notifications()
end, {
  desc = "Notification History",
})

map("n", "<leader>e", function()
  Snacks.explorer()
end, {
  desc = "File Explorer",
})

map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, {
  desc = "Buffers",
})

map("n", "<leader>fc", function()
  Snacks.picker.files { cwd = vim.fn.stdpath "config" }
end, {
  desc = "Find Config File",
})

map("n", "<leader>ff", function()
  Snacks.picker.files()
end, {
  desc = "Find Files",
})

map("n", "<leader>fg", function()
  Snacks.picker.git_files()
end, {
  desc = "Find Git Files",
})

map("n", "<leader>fp", function()
  Snacks.picker.projects()
end, {
  desc = "Projects",
})

map("n", "<leader>fr", function()
  Snacks.picker.recent()
end, {
  desc = "Recent",
})
-- git
map("n", "<leader>gb", function()
  Snacks.picker.git_branches()
end, {
  desc = "Git Branches",
})

map("n", "<leader>gl", function()
  Snacks.picker.git_log()
end, {
  desc = "Git Log",
})

map("n", "<leader>gL", function()
  Snacks.picker.git_log_line()
end, {
  desc = "Git Log Line",
})

map("n", "<leader>gs", function()
  Snacks.picker.git_status()
end, {
  desc = "Git Status",
})

map("n", "<leader>gS", function()
  Snacks.picker.git_stash()
end, {
  desc = "Git Stash",
})

map("n", "<leader>gd", function()
  Snacks.picker.git_diff()
end, {
  desc = "Git Diff (Hunks)",
})

map("n", "<leader>gf", function()
  Snacks.picker.git_log_file()
end, {
  desc = "Git Log File",
})

-- Grep
map("n", "<leader>sb", function()
  Snacks.picker.lines()
end, {
  desc = "Buffer Lines",
})

map("n", "<leader>sB", function()
  Snacks.picker.grep_buffers()
end, {
  desc = "Grep Open Buffers",
})

map("n", "<leader>sg", function()
  Snacks.picker.grep()
end, {
  desc = "Grep",
})

map("n", "<leader>sw", function()
  Snacks.picker.grep_word()
end, {
  desc = "Visual selection or word",
})

-- search
map("n", '<leader>s"', function()
  Snacks.picker.registers()
end, {
  desc = "Registers",
})

map("n", "<leader>s/", function()
  Snacks.picker.search_history()
end, {
  desc = "Search History",
})

map("n", "<leader>sa", function()
  Snacks.picker.autocmds()
end, {
  desc = "Autocmds",
})

map("n", "<leader>sb", function()
  Snacks.picker.lines()
end, {
  desc = "Buffer Lines",
})

map("n", "<leader>sc", function()
  Snacks.picker.command_history()
end, {
  desc = "Command History",
})

map("n", "<leader>sC", function()
  Snacks.picker.commands()
end, {
  desc = "Commands",
})

map("n", "<leader>sd", function()
  Snacks.picker.diagnostics()
end, {
  desc = "Diagnostics",
})

map("n", "<leader>sD", function()
  Snacks.picker.diagnostics_buffer()
end, {
  desc = "Buffer Diagnostics",
})

map("n", "<leader>sh", function()
  Snacks.picker.help()
end, {
  desc = "Help Pages",
})

map("n", "<leader>sH", function()
  Snacks.picker.highlights()
end, {
  desc = "Highlights",
})

map("n", "<leader>si", function()
  Snacks.picker.icons()
end, {
  desc = "Icons",
})

map("n", "<leader>sj", function()
  Snacks.picker.jumps()
end, {
  desc = "Jumps",
})

map("n", "<leader>sk", function()
  Snacks.picker.keymaps()
end, {
  desc = "Keymaps",
})

map("n", "<leader>sl", function()
  Snacks.picker.loclist()
end, {
  desc = "Location List",
})

map("n", "<leader>sm", function()
  Snacks.picker.marks()
end, {
  desc = "Marks",
})

map("n", "<leader>sM", function()
  Snacks.picker.man()
end, {
  desc = "Man Pages",
})

map("n", "<leader>sp", function()
  Snacks.picker.lazy()
end, {
  desc = "Search for Plugin Spec",
})

map("n", "<leader>sq", function()
  Snacks.picker.qflist()
end, {
  desc = "Quickfix List",
})

map("n", "<leader>sR", function()
  Snacks.picker.resume()
end, {
  desc = "Resume",
})

map("n", "<leader>su", function()
  Snacks.picker.undo()
end, {
  desc = "Undo History",
})

map("n", "<leader>uC", function()
  Snacks.picker.colorschemes()
end, {
  desc = "Colorschemes",
})

-- LSP
map("n", "gd", function()
  Snacks.picker.lsp_definitions()
end, {
  desc = "Goto Definition",
})

map("n", "gD", function()
  Snacks.picker.lsp_declarations()
end, {
  desc = "Goto Declaration",
})

map("n", "gr", function()
  Snacks.picker.lsp_references()
end, {
  nowait = true,
})

map("n", "gI", function()
  Snacks.picker.lsp_implementations()
end, {
  desc = "Goto Implementation",
})

map("n", "gy", function()
  Snacks.picker.lsp_type_definitions()
end, {
  desc = "Goto T[y]pe Definition",
})

map("n", "<leader>ss", function()
  Snacks.picker.lsp_symbols()
end, {
  desc = "LSP Symbols",
})

map("n", "<leader>sS", function()
  Snacks.picker.lsp_workspace_symbols()
end, {
  desc = "LSP Workspace Symbols",
})

-- }}}
