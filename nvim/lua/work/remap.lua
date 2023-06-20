vim.g.mapleader = " "

-- NvimTree
vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>")

-- Trouble
vim.keymap.set("n", "<leader>tt", ":TroubleToggle document_diagnostics<CR>")

-- maps copying into system registry
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

-- replace in place
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
