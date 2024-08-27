vim.g.mapleader = " "

-- NvimTree
vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>")

-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")

-- maps copying into system registry
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

-- replace in place
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Use TreeSetter folding
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
