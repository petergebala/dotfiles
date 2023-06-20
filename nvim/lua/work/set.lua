vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.ruler = true
vim.opt.cursorline = true

vim.opt.wildignorecase = true
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.listchars = { trail = '·', tab = '»·' }

vim.opt.encoding = "utf-8"
vim.opt.fileformat = "unix"

vim.opt.smartindent = true
vim.opt.laststatus = 2
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"

vim.opt.updatetime = 50
vim.opt.history = 50

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.background = "dark"
