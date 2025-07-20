-- vim: set foldmethod=marker:

return {

  -- Conform {{{
  -- Code formatters
  require "configs.conform",
  -- }}}

  -- Dap {{{
  -- Debuggers
  require "configs.dap",
  -- Virtual text support, treesitter to find variable definitions
  require "configs.dap-virtual-text",
  -- User interface for dap
  require "configs.dapui",
  -- Telescope integration, overrides some dap commands to use telescope
  require "configs.telescope-dap",
  -- }}}

  -- Dial {{{
  -- Increment / Decrement
  require "configs.dial",
  -- }}}

  -- Illuminate {{{
  -- Highlights other uses of the word under the cursor
  require "configs.illuminate",
  -- }}}

  -- Kitty Scrollback {{{
  -- Open kitty scrollback in neovim
  require "configs.kitty-scrollback",
  -- }}}

  -- Leap {{{
  -- For jumping to text using s{char1}{char2}
  require "configs.leap",
  -- }}}

  -- Lint {{{
  -- Linters
  require "configs.lint",
  -- }}}

  -- Lsp {{{
  -- Lsp
  require "configs.lspconfig",
  -- }}}

  -- mkdir {{{
  -- Automatically create missing directories when saving files
  require "configs.mkdir",
  -- }}}

  -- Markdown {{{
  -- Better navigation
  require "configs.mkdnflow",
  -- Better markdown rendering
  require "configs.render-markdown",
  -- }}}

  -- nio {{{
  -- async IO, used by nvim-dap-ui
  require "configs.nio",
  -- }}}

  -- Overseer {{{
  -- task runner and job management
  require "configs.overseer",
  -- }}}

  -- Snacks {{{
  -- A collection of small QoL plugins
  require "configs.snacks",
  -- }}}

  -- Sort {{{
  -- Improved sorting
  require "configs.sort",
  -- }}}

  -- Tabtree {{{
  -- Use tab to navigate through code
  require "configs.tabtree",
  -- }}}

  -- Todo Comments {{{
  -- Highlight TODO comments
  require "configs.todo-comments",
  -- }}}

  -- Toggleterm {{{
  -- Terminal in nvim
  require "configs.toggleterm",
  -- }}}

  -- Treesitter {{{
  -- Better highlighting, language parsing and queries
  require "configs.treesitter",
  -- }}}

  -- Undotree {{{
  -- Show undo history in a tree
  require "configs.undotree",
  -- }}}
}
