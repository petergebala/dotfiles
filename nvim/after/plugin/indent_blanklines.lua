vim.cmd([[highlight IndentBlanklineChar guifg='#444444' gui=nocombine]])

require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = false,
  show_current_context_start = true,
}
