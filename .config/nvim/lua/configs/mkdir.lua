return {
  "jghauser/mkdir.nvim",
  event = { "BufWritePre" },
  config = function()
    require "mkdir"
  end,
}
