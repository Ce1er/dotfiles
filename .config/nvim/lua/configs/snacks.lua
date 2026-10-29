return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = {
      enabled = false,
      notify = true,
      size = 5 * 1024 * 1024, -- 5MB
    },
    dashboard = { enabled = true },
    explorer = { enabled = true }, -- Consider making default
    indent = { enabled = true },
    image = { enabled = true, doc = {
      max_width = 150,
      max_height = 150,
    } },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
