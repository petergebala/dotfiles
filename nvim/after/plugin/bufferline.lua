print(" - Loading Bufferline")

require("bufferline").setup({
  options = {
    themable = false,
    tab_size = 15,
    separator_style = "thin",
    show_buffer_close_icons = false,
    show_close_icon = false,
    mode = "tabs",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    sort_by = "buffer id",
    offsets = {
      {
        filetype = "NvimTree",
        highlight = "Directory",
        text = "File Explorer",
        text_align = "left"
      },
    }
  }
})
