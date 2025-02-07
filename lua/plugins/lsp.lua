return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')
    lspconfig.gopls.setup({
      on_attach = function(client, bufnr)
        -- Keybindings for LSP
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)          -- Hover docs
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts) -- Function signature
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)   -- Go to definition
      end,
      flags = {
        debounce_text_changes = 150,
      },
    })
  end
}

