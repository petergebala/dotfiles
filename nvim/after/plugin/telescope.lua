print(" - Loading Telescope")

require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { height = 0.95, width = 0.95 },
  },
}

require("telescope").load_extension("live_grep_args")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- File finder
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})  -- Git repo file finder
vim.keymap.set('n', '<leader>gg', require('telescope').extensions.live_grep_args.live_grep_args, {})  -- Live grep
