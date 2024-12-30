print(" - Loading Telescope")

require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { height = 0.95, width = 0.95 },
  },
}

local builtin = require('telescope.builtin')
local live_multigrep = require('../../lua/config/telescope/multigrep').setup

vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- File finder
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})  -- Git repo file finder
vim.keymap.set('n', '<leader>gg', live_multigrep, {})  -- Live grep
