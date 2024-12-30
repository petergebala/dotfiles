print(" - Loading LSP Zero")

local lsp = require('lsp-zero').preset({})
local nvim_lsp = require("lspconfig")


local handle = io.popen([[rvm current]])
local ruby_version = handle:read("*a")
handle:close()

vim.print(ruby_version)

lsp.ensure_installed({
  'rust_analyzer'
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- (Optional) Configure solagraph language server for neovim
require('lspconfig').solargraph.setup{
  cmd = { 'rvm', ruby_version, 'do', 'solargraph', 'stdio' },
  -- cmd = { 'solargraph', 'stdio' },
  root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
  settings = {
    solargraph = {
      autoformat = false,
      formatting = true,
      completion = true,
      diagnostic = true,
      definitions = true,
      highlights = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  }
}
lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = {
    { name = 'supermaven' },
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
  },
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
})

