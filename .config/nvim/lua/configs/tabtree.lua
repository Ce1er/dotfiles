return {
  "roobert/tabtree.nvim",
  keys = { "<Tab>", "<S-Tab>" },
  config = function()
    require("tabtree").setup {
      -- print the capture group name when executing next/previous
      -- debug = true,

      -- disable key bindings
      -- key_bindings_disabled = true,
      --
      -- key_bindings = {
      --   next = "<Tab>",
      --   previous = "<S-Tab>",
      -- },
      --
      -- use :InspectTree to discover the (capture group)
      -- @capture_name can be anything
      language_configs = {
        python = {
          target_query = [[
              (string) @string_capture
              (interpolation) @interpolation_capture
              (parameters) @parameters_capture
              (argument_list) @argument_list_capture
              (for_statement) @loop
              (class_definition) @class 
              (while_statement) @loop
              (if_statement) @conditional
            ]],
          -- experimental feature, to move the cursor in certain situations like when handling python f-strings
          offsets = {
            string_start_capture = 1,
          },
        },

        lua = { -- Not functional for some reason
          target_query = [[
            (function_definition) @function
            (for_statement) @loop
            (while_statement) @loop
            (if_statement) @conditional
            (table_constructor) @table
            (string) @string
          ]],
          offsets = {},
        },

        xml = {
          target_query = [[
          (element) @element
          (Attribute) @attribute
        ]],
          offsets = {},
        },

        markdown = { -- Only working for links
          target_query = [[
            (atx_heading) @heading
            (setext_heading) @heading
            (list_item) @list_item
            (fenced_code_block) @code_block
            (inline_code_block) @code_block
            (pipe_table_cell) @table_cell
            (link) @link
            (strong_emphasis) @emphasis
            (emphasis) @emphasis
          ]],
          offsets = {},
        },
        --
        -- default_config = {
        --   target_query = [[
        --         (string) @string_capture
        --         (interpolation) @interpolation_capture
        --         (parameters) @parameters_capture
        --         (argument_list) @argument_list_capture
        --     ]],
        --   offsets = {},
        -- },
      },
    }
  end,
}
